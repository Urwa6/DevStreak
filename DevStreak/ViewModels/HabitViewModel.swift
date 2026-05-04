//
//  HabitViewModel.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-30.
//
import Foundation
import SwiftData

//View Model responsible for handling all Habit-related logics
//Acts as a bridge between Views & Models

@Observable
class HabitViewModel {
    
    //Used for creating,updating & saving data
    var context: ModelContext
      
    //Initializer
    init (context: ModelContext) {
        self.context = context
    }
    
    ///CREATE HABIT
    
    //Creates a new habit & saves it to the database
    func addHabit(name: String, icon: String, targetPerDay: Int) {
        let habit = Habit(name: name, icon: icon, targetPerDay: targetPerDay)
        context.insert(habit)
        //Persist changes
        try? context.save()
        
    }
    
    ///MARK COMPLETED
    //Marks a habit as completed for today & save the update
    func markCompleted(_ habit: Habit) {
        habit.completedDates.append(Date())
        try? context.save()
    }
    
    func completionsToday(for habit: Habit) -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        
        return habit.completedDates.filter {
            Calendar.current.isDate($0, inSameDayAs: today)
        }.count
    }
       
    
    
    ///STREAK LOGIC
    // Calculates current streak based on consecutive completion dates
    func streak(for habit: Habit) -> Int {
        // Sort dates from newest to oldest
        let sorted = habit.completedDates
            .map(Calendar.current.startOfDay(for:))
            .sorted(by: >)
        
        var streak = 0
        var currentDate = Calendar.current.startOfDay(for: Date())
        
        // Loop through completion dates and check continuity
        for date in sorted {
            if Calendar.current.isDate(date, inSameDayAs: currentDate) {
                streak += 1
                // Move one day back to check continuity
                currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
            } else {
                break
            }
}
        return streak
    }
}


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
        let today = Calendar.current.startOfDay(for: Date())
        //Check how many completions today
        let countToday = habit.completedDates.filter{
            Calendar.current.isDate($0, inSameDayAs: today)
        }.count
        //Only allow up to target per day
        if countToday < habit.targetPerDay{
           // habit.completedDates.append(Date())
            habit.completedDates.append(Calendar.current.startOfDay(for: Date()))
        }
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
        
        let calender = Calendar.current
        //Group by day
        let grouped = Dictionary(grouping: habit.completedDates){
            calender.startOfDay(for: $0)
        }
        var streak = 0
        var currentDate = calender.startOfDay(for: Date())
        
        while true {
            let completions = grouped[currentDate]?.count ?? 0
            if completions >= habit.targetPerDay{
                streak += 1
                currentDate = calender.date(byAdding: .day, value: -1, to: currentDate)!
            }
            else{
                break
            }
        }
        return streak
        
        
    }
    
}

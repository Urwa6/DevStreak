//
//  HabitViewModel.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-30.
//
import Foundation
import SwiftData

@Observable
class HabitViewModel {
    
    var context: ModelContext
    
    init (context: ModelContext) {
        self.context = context
    }
    
    func addHabit(name: String, icon: String) {
        let habit = Habit(name: name, icon: icon)
        context.insert(habit)
        try? context.save()
        
    }
    func markCompleted(_ habit: Habit) {
        habit.markCompletedToday()
        try? context.save()
        
    }
    
    func streak(for habit: Habit) -> Int {
        let sorted = habit.completedDates.sorted(by: >)
        var streak = 0
        var currentDate = Date()
        
        for date in sorted {
            if Calendar.current.isDate(date, inSameDayAs: currentDate) {
                streak += 1
                currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
            } else {
                break
            }
}
        return streak
    }
}


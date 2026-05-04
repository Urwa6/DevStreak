//
//  Habit.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//
import Foundation
import SwiftData


//This is the main data model for a Habit in the app
//@Model makes it persistable using Swiftdata
@Model
class Habit {
    var name: String
    var icon: String
    
    var targetPerDay: Int
    
    // Store all completed dates
    var completedDates: [Date]
    
    var createdAt: Date
    
    //Initilazier used when creating a new Habit
    init(name: String, icon: String, targetPerDay: Int = 1) {
        self.name = name
        self.icon = icon
        self.targetPerDay = targetPerDay
        //Start with an empty array
        self.completedDates = []
        //Set creation date to now
        self.createdAt = Date()
        
        func markCompletedToday() {
            let today = Calendar.current.startOfDay(for: Date())
            
            // Check if already completed today
            let alreadyDone = completedDates.contains {
                Calendar.current.isDate($0, inSameDayAs: today)
            }
            
            if !alreadyDone {
                completedDates.append(today)
            }
        }
    }
}

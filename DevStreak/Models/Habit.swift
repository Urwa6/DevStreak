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
    
    // Store all completed dates
    var completedDates: [Date]
    
    var createdAt: Date
    
    //Initilazier used when creating a new Habit
    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
        //Start with an empty array
        self.completedDates = []
        //Set creation date to now
        self.createdAt = Date()
    }
}

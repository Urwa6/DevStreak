//
//  DevStreakApp.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//

import SwiftUI
import SwiftData

@main
struct DevStreakApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Habit.self)
    }
}

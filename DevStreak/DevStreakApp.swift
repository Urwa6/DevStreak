//
//  DevStreakApp.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//

import SwiftUI
import SwiftData
//For Notification
import UserNotifications

@main
struct DevStreakApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
          // HomeView()
        }
        .modelContainer(for: Habit.self)
    }
}

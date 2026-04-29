//
//  HabitRowView.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//
import SwiftUI

struct HabitRowView: View {
    
    let habit : Habit
    
    var body: some View {
        
        HStack {
            
            //ICON
            Image(systemName: habit.icon)
                .frame(width: 30)
            
            //Name
            Text(habit.name)
            .font(.headline)
            
            Spacer()
            
            //Placeholder streak
            //Will connect logic later
            Text("🔥 0")
                .foregroundStyle(.orange)
            
        }
        .padding(.vertical, 28)
    }
}

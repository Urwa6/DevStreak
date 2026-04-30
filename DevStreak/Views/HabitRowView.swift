//
//  HabitRowView.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//
import SwiftUI

struct HabitRowView: View {
    
    let habit : Habit
    
    let viewModel : HabitViewModel
    
    var body: some View {
        
        HStack {
            
            //ICON
            Image(systemName: habit.icon)
                .frame(width: 30)
            
            //Name
            Text(habit.name)
            .font(.headline)
            
            Spacer()
            
            Button {

                     viewModel.markCompleted(habit)

                 } label: {

                     Image(systemName: "checkmark.circle")

                         .foregroundColor(.green)

                 }
            
            //Placeholder streak
            //Will connect logic later
            //Working streak
            Text("🔥 \(viewModel.streak(for: habit))")
                .foregroundStyle(.orange)
            
        }
        .padding(.vertical, 28)
    }
}

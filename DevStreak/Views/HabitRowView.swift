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
    
    //Mark-Computed Values
    
    var countToday: Int {
          viewModel.completionsToday(for: habit)
      }
      
      var isDoneToday: Bool {
          countToday >= habit.targetPerDay
      }
    

    var body: some View {
        
        HStack {
            
            //ICON
            Image(systemName: habit.icon)
                .frame(width: 30)
            
            //Name
            Text(habit.name)
            .font(.headline)
            
            Spacer()
            
            //Progress Button
            
            Button {
                

                     viewModel.markCompleted(habit)

                 } label: {
                     
                     

                     Image(systemName: isDoneToday ? "checkmark.circle": "circle")

                         .foregroundColor( isDoneToday ? .green : .gray)
                     
                     Text("\(countToday)/\(habit.targetPerDay)")
                         .font(.caption2)
                         .foregroundColor(isDoneToday ? .green : .gray)
                 }
                         .animation(.easeInOut, value: isDoneToday)
                     }
                
                 .disabled(isDoneToday)
                 .opacity(isDoneToday ? 0.5 : 1)
            
            
            //Placeholder streak
            //Will connect logic later
            //Working streak
            Text("🔥 \(viewModel.streak(for: habit))")
                .foregroundStyle(.orange)
            
        }
    }


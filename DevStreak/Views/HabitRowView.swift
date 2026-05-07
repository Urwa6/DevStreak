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
                .foregroundColor(Color("AppPrimary"))
            
            //Name
            Text(habit.name)
            .font(.headline)
            .foregroundColor(Color("AppPrimary"))
            
            Spacer()
            
            //Progress Button
            
            Button {
                

                     viewModel.markCompleted(habit)

                 } label: {
                     
                     HStack (spacing:6){
                         Image(systemName: isDoneToday ? "checkmark.circle": "circle")
                             .foregroundColor( isDoneToday ? Color (red:0.0, green:0.45, blue:0.0) : .gray)
                         
                         Text("\(countToday)/\(habit.targetPerDay)")
                             .font(.caption2)
                             .foregroundColor( isDoneToday ? Color (red:0.0, green:0.45, blue:0.0) : .gray)
                            
                     }
                         
                     }

                
                         .animation(.easeInOut, value: isDoneToday)
                     }
                
                 .disabled(isDoneToday)
                 .opacity(isDoneToday ? 0.5 : 1)
            
            
            //Placeholder streak
            //Will connect logic later
            //Working streak
            Text("🔥 \(viewModel.streak(for: habit))")
                .foregroundStyle(Color("AppPrimary"))
            
        }
    }


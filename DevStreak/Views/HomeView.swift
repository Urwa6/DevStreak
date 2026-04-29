//
//  ContentView.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//

import SwiftUI
import SwiftData



struct HomeView: View {
    
    //Fetch Habits from SWiftdata database
    @Query var habits: [Habit]
    //Controls whether the Add habit sheet is visible 
    @State private var showAddHabit = false
   
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(habits) { habit in
                    HabitRowView(habit: habit)
                }
                
            }
            .navigationTitle("DevStreak 🔥")
            .toolbar{
                Button{
                    showAddHabit = true
                }
            label: {
                    Image(systemName: "plus")
                }
            }
            // Sheet for adding habits (IMPORTANT PART)
                     .sheet(isPresented: $showAddHabit) {
                         AddHabitView()
                     }
        }
    }
}
    #Preview {
        HomeView()
    }


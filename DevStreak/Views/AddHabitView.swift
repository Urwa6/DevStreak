//
//  Untitled.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//

import SwiftUI
import SwiftData

// View responsible for creating a new Habit
// Uses HabitViewModel to handle data creation logic

struct AddHabitView: View {
   
    //Injected ViewModel used to manage Habit creation
    let viewModel: HabitViewModel
    
    //Controls view dismissal(Sheet close)
    @Environment(\.dismiss) var dismiss
    
    //For USER's input
    @State private var name: String = ""
    @State private var icon: String = "flame"
    
    var body: some View {
            NavigationStack {
                
                //Form for entering habit details
                Form {
                    
                    TextField("Habit name", text: $name)
                    
                    TextField("SF Symbol (e.g. flame)", text: $icon)
                }
                
                .navigationTitle("New Habit")
                .toolbar {ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addHabit(name: name, icon: icon)
                        dismiss()
                    }
                }
            }
        }
    }
    
}

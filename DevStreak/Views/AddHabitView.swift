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
    @State private var target: Int = 1
    
    var body: some View {
            NavigationStack {
                
                //Form for entering habit details
                Form {
                    
                    TextField("Habit name", text: $name)
                    
                    TextField("SF Symbol (e.g. flame)", text: $icon)
                    Stepper("Times per day: \(target)", value: $target, in: 1...20)
                }
                
                .navigationTitle("New Habit")
                .toolbar {ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addHabit(name: name, icon: icon, targetPerDay: target)
                        dismiss()
                    }
                }
            }
        }
    }
    
}

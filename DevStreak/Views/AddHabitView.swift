//
//  Untitled.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//

import SwiftUI
import SwiftData

struct AddHabitView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var icon: String = "flame"
    var body: some View {
            NavigationStack {
                
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
                        addHabit()
                    }
                }
            }
        }
    }
    
    func addHabit() {
        let habit = Habit(name: name, icon: icon)
        print("Saving habit:", habit.name)
        context.insert(habit)
        try? context.save()
        dismiss()
    }
}

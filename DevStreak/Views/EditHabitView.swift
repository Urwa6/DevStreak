//
//  EditHabitView.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-05-04.
//

import SwiftUI
import SwiftData

struct EditHabitView: View {
    
    @Bindable var habit: Habit
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $habit.name)
                TextField("Icon", text: $habit.icon)
            }
            .navigationTitle("Edit Habit")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

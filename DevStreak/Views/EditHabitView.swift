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
            ZStack{
                //Color
                Color("AppBackground")
                    .ignoresSafeArea()
                
            Form {
                TextField("Name", text: $habit.name)
                TextField("Icon", text: $habit.icon)
            }
            .scrollContentBackground(.hidden)
        }
            .navigationTitle("Edit Habit")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
                .foregroundColor(Color("AppAccent"))
            }
        }
    }
}

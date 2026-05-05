//
//  ContentView.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-04-29.
//

import SwiftUI
import SwiftData



struct HomeView: View {
    
    @Environment(\.modelContext) var context
    
    //Fetch Habits from SWiftdata database
    @Query var habits: [Habit]
    //Controls whether the Add habit sheet is visible 
    @State private var showAddHabit = false
    
    @State private var selectedHabit: Habit?
    @State private var showEditSheet = false

    
    // ViewModel
       var viewModel: HabitViewModel {
        HabitViewModel(context: context)
       }
 
    var body: some View {
            NavigationStack {
                
                List {
                    ForEach(habits) { habit in
                        HabitRowView(habit: habit, viewModel: viewModel)
                            .onLongPressGesture {
                                selectedHabit = habit
                                showEditSheet = true
                            }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let habit = habits[index]
                            context.delete(habit)
                        }
                        try? context.save()
                    }
                }
                
                
                .navigationTitle("DevStreak 🔥")
                
                .toolbar {
                    Button {
                        showAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                .sheet(isPresented: $showAddHabit) {
                    AddHabitView(viewModel: viewModel)
                }
                
                .sheet(isPresented: $showEditSheet) {
                    if let selectedHabit {
                        EditHabitView(habit: selectedHabit)
                    }
                }
            }
        }
    }
            
            #Preview {
                let container = try! ModelContainer(for: Habit.self)
                
                HomeView()
                    .modelContainer(container)
            }

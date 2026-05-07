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
    //Edit fix
    @State private var selectedHabit: Habit?
    
    // ViewModel
       var viewModel: HabitViewModel {
        HabitViewModel(context: context)
       }
 
    var body: some View {
            NavigationStack {
                
                //Adding background color
                ZStack {
                    Color("AppBackground")
                        .ignoresSafeArea()
            
                List {
                    ForEach(habits) { habit in
                        HabitRowView(habit: habit, viewModel: viewModel)
                        //Adding background color
                            .listRowBackground(Color("AppSecondary").opacity(0.55))
                        
                            .onLongPressGesture {
                                selectedHabit = habit
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
                    //Background
                .scrollContentBackground(.hidden)
                }
                
                .navigationTitle("Habit Tracker")
                .toolbar {
                    Button {
                        showAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                        .foregroundColor(Color("AppAccent"))
                            .padding(25)
                    }
                }
                //Add habit sheet
                .sheet(isPresented: $showAddHabit) {
                    AddHabitView(viewModel: viewModel)
                }
                //Edit Habit sheet
                .sheet(item: $selectedHabit) { habit in
                        EditHabitView(habit: habit)
                    }
                }
            }
        }
            
            #Preview {
                let container = try! ModelContainer(for: Habit.self)
                
                RootView()
                    .modelContainer(container)
            }

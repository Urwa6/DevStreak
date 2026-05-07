//
//  Stati.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-05-07.
//
import SwiftUI
import SwiftData
import Charts

struct StatisticsView: View {
    
    //Fetch all habits from SwiftData
    @Query var habits: [Habit]
    
    var body: some View{
        
        NavigationStack{
            ScrollView{
                VStack(spacing:20){
                    
                    //Title
                    Text("Your Habit Stats")
                        .font(.largeTitle.bold())
                    
                    //Mark total completeion card
                    let totalCompletions = habits.reduce(0) {
                        $0 + $1.completedDates.count
                    }
            
                    VStack(spacing: 8){
                        Text("\(totalCompletions)")
                        .font(.system(size: 50, weight: .bold))

                        Text("Total Completions")
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("AppSecondary").opacity(0.55))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                }
                //Per HAbit Chart
                Chart{
                    ForEach(habits){ habit in
                        
                        BarMark(
                            x: .value("Habit", habit.name),
                            y: .value("Completion", habit.completedDates.count)
                        )
                        .foregroundStyle(Color("AppAccent"))
                        
                    }
                }
                .frame(height: 250)
                .padding()
                .background(Color("AppSecondary").opacity(0.55))
                .clipShape(RoundedRectangle(cornerRadius: 22))
                
                //Habit breakdown list
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Per Habit Breakdown")
                        .font(.headline)
                    
                    ForEach (habits){ habit in
                        
                        HStack{
                            Image(systemName: habit.icon)
                                .foregroundColor(Color("AppPrimary"))
                            
                            Text(habit.name)
                            
                            Spacer()
                            
                            Text("\(habit.completedDates.count)")
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 6)
                    }
                }
                .padding()
                .background(Color("AppSecondary").opacity(0.55))
                .clipShape(RoundedRectangle(cornerRadius: 22))
            }
            .padding()
        }
        .background(Color("AppBackground"))
        .navigationTitle("Statistics")
    }
    }

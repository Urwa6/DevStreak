//
//  RootView.swift
//  DevStreak
//
//  Created by Urwa Adil on 2026-05-07.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        
        TabView{
            
            HomeView()
                .tabItem{
                    Label("Habits", systemImage: "checkmark.circle")
                }
            
            StatisticsView()
                .tabItem{
                    Label("Stats", systemImage: "chart.bar.fill")
                }
        }
        .tint(Color("AppAccent"))
    }
}

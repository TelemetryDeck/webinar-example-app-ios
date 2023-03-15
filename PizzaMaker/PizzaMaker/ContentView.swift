//
//  ContentView.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 30.11.22.
//

import SwiftUI
import TelemetryClient

struct ContentView: View {
    @AppStorage("isPurchased") private var isPurchased = false
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        if showOnboarding {
            OnboardingView()
        } else {
            NavigationStack {
                VStack(spacing: 10) {
                    Text("🍕")
                        .font(.largeTitle)
                        .padding()
                    
                    NavigationLink {
                        DoughTimer()
                    } label: {
                        Label("Dough Timer", systemImage: "timer")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                    .padding()
                    
                    NavigationLink {
                        BakingTimer()
                    } label: {
                        Label("Baking Timer", systemImage: "oven")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                    .padding()
                    
                    NavigationLink {
                        Settings()
                    } label: {
                        Text("Settings")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BorderedButtonStyle())
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .navigationTitle("Pizza Maker \(isPurchased ? "Pro" : "Lite")")
            }
            .onAppear {
                TelemetryManager.send("view", with: ["viewName": "ContentView"])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

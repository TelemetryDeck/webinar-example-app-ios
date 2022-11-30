//
//  ContentView.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 30.11.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
            .navigationTitle("Pizza Maker Pro")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

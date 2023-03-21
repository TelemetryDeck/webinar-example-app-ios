//
//  OnboardingView.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 15.03.23.
//

import SwiftUI
import TelemetryClient

struct OnboardingView: View {
    @State private var currentPage = 0
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingScreen(image: "fork.knife", title: "Welcome to PizzaMaker", description: "This app helps you make amazing pizza.").tag(0)
                OnboardingScreen(image: "onboarding2", title: "Get started quickly", description: "Just follow the steps to get up and running in no time.").tag(1)
                OnboardingScreen(image: "onboarding3", title: "Enjoy the app", description: "We hope you enjoy using PizzaMaker!").tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onChange(of: currentPage) { newPage in
                print("Page changed to \(newPage)!")
                TelemetryManager.send("onboardingPageDisplayed", with: ["page": "\(newPage)"])
            }

            if currentPage == 2 {
                // Last onboarding screen
                Button(action: {
                    showOnboarding = false
                }) {
                    Text("Start using PizzaMaker")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            } else {
                // Buttons to navigate through the onboarding screens or to skip
                HStack {
                    if currentPage > 0 {
                        Button(action: {
                            currentPage -= 1
                        }) {
                            Text("Back")
                                .fontWeight(.semibold)
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showOnboarding = false
                    }) {
                        Text("Skip")
                            .fontWeight(.semibold)
                    }
                    .padding()
                }
            }
        }
    }
}

struct OnboardingScreen: View {
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top)
                .frame(maxWidth: 100)
            
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

//
//  PizzaMakerApp.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 30.11.22.
//

import SwiftUI
import TelemetryClient

@main
struct PizzaMakerApp: App {
    @AppStorage("DisplayUnit") private var displayUnit = "Metric"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        let configuration = TelemetryManagerConfiguration(appID: "02C49F2E-F3FF-4715-BBB6-C381F9541905")
        // optional: modify the configuration here
        TelemetryManager.initialize(with: configuration)
        
        TelemetryManager.send("appLaunchedRegularly", with: ["DisplayUnit" : displayUnit])
    }
}

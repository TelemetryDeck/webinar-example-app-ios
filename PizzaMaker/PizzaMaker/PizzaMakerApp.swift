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
        let configuration = TelemetryManagerConfiguration(appID: "89F5DC65-0762-43ED-ABEF-984FE6D1574E")
        // optional: modify the configuration here
        TelemetryManager.initialize(with: configuration)
        
        TelemetryManager.send("appLaunchedRegularly", with: ["DisplayUnit" : displayUnit])
    }
}

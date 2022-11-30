//
//  Settings.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 30.11.22.
//

import SwiftUI
import TelemetryClient

struct Settings: View {
    @AppStorage("DisplayUnit") private var displayUnit = "Metric"
    var availableUnits = ["Metric", "Imperial", "Radians"]
    
    var pizzaDescriptionText: String {
        get {
            switch displayUnit {
            case "Metric":
                return "Your pizza is 32cm in diameter and weighs 300g"
            case "Imperial":
                return "Your pizza is 12.6in in diameter and weighs 10oz"
            default:
                return "π * z * z * a"
            }
        }
    }

    var body: some View {
        Form {
            Section {
                
                Picker("What is your favorite color?", selection: $displayUnit) {
                    ForEach(availableUnits, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Units")
            } footer: {
                Text(pizzaDescriptionText)
            }

            Section("Privacy & Analytics") {
                Text("We use Telemetrydeck for easy, anonymous analytics without infringing on your privacy.")
                Button("TelemetryDeck Privacy Policy") {
                    if let url = URL(string: "https://telemetrydeck.com/privacy/") {
                        UIApplication.shared.open(url)
                    }
                }
            }
        }
        .onAppear {
            TelemetryManager.send("view", with: ["viewName": "Settings"])
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

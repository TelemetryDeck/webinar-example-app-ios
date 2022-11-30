//
//  BakingTimer.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 30.11.22.
//

import SwiftUI
import TelemetryClient

struct BakingTimer: View {
    @State private var timeElapsed: Float = 0
    @State private var timerIsRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var elapsedTimeLabel: String {
        let hours = Int((timeElapsed/60/60).truncatingRemainder(dividingBy: 60))
        let minutes = Int((timeElapsed/60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(timeElapsed.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    func toggleTimer() {
        withAnimation {
            timerIsRunning.toggle()
        }
    }

    func resetTimer() {
        timeElapsed = 0
    }

    var body: some View {
        VStack {
            HStack {
                if !timerIsRunning {
                    Button {
                        resetTimer()
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(.orange.opacity(0.75))
                            .clipShape(Capsule())
                    }
                }

                Button {
                    toggleTimer()
                } label: {
                    Text(elapsedTimeLabel)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(.orange.opacity(0.75))
                        .clipShape(Capsule())
                }

                Button {
                    toggleTimer()
                } label: {
                    Image(systemName: timerIsRunning ? "pause.fill" : "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(.orange.opacity(0.75))
                        .clipShape(Capsule())
                }
            }

            Text("Use this timer to measure how long your pizza stays in the oven")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text("\(timeElapsed)")
        }
        .navigationTitle("Baking Timer")
        .onReceive(timer) { _ in
            guard timerIsRunning else { return }
            timeElapsed += 1
        }
        .onAppear {
            TelemetryManager.send("view", with: ["viewName": "BakingTimer"])
        }
    }
}

struct BakingTimer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BakingTimer()
        }
    }
}

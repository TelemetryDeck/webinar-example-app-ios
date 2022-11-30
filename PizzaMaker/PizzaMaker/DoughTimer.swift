//
//  DoughTimer.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 30.11.22.
//

import SwiftUI

struct DoughTimer: View {
    @State private var timeRemaining: Float = 28800
    @State private var timerIsRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var remainingTimeLabel: String {
        let hours = Int((timeRemaining/60/60).truncatingRemainder(dividingBy: 60))
        let minutes = Int((timeRemaining/60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(timeRemaining.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    func toggleTimer() {
        withAnimation {
            timerIsRunning.toggle()
        }
    }

    func resetTimer() {
        timeRemaining = 28800
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
                            .background(.cyan.opacity(0.75))
                            .clipShape(Capsule())
                    }
                }

                Button {
                    toggleTimer()
                } label: {
                    Text(remainingTimeLabel)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(.cyan.opacity(0.75))
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
                        .background(.cyan.opacity(0.75))
                        .clipShape(Capsule())
                }
            }

            Text("Your dough should rest at least 8 hours in the fridge.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .navigationTitle("Dough Timer")
        .onReceive(timer) { _ in
            guard timerIsRunning else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}

struct DoughTimer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DoughTimer()
        }
    }
}

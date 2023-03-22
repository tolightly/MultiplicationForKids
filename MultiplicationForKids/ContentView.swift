//
//  ContentView.swift
//  MultiplicationForKids
//
//  Created by Denys Nazymok on 16.03.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject var gameData = GameData()
    // Alert State
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Select start and end range numbers for chalenge")
                    Stepper("Start number: \(gameData.startNumber.formatted())", value: $gameData.startNumber, in: 1...100, step: 1, format: .number)
                    Stepper("End number: \(gameData.endNumber.formatted())", value: $gameData.endNumber, in: 1...100, step: 1, format: .number)
                }
                Section {
                    Text("Select number of rounds")
                    Stepper("Rounds: \(gameData.rounds.formatted())", value: $gameData.rounds, in: 1...20, step: 1, format: .number)
                }
                Section {
                    NavigationLink {
                        GameView(gameData: gameData)
                    } label: {
                        Text("Start Game")
                    }
                }
            }
            .navigationTitle("MultipleMe")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(alertMessage)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

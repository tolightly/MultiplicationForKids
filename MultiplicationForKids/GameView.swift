//
//  GameView.swift
//  MultiplicationForKids
//
//  Created by Denys Nazymok on 19.03.2023.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameData: GameData
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var randomNumber1 = 0
    @State private var randomNumber2 = 0
    @State private var answer = ""
    @State private var haveAnswer = false
    @State private var isGameOver = false
    
    var body: some View {
        NavigationView {
            Form {
                Text("How is \(randomNumber1) x \(randomNumber2)?")
                TextField("Enter your answer here", text: $answer)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        nextRound()
                    }
                    .submitLabel(.continue)
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("Next") {
                                nextRound()
                            }
                        }
                    }
            }
            .onAppear(perform: startGame)
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
            .alert(alertTitle, isPresented: $haveAnswer) {
                Button("Next") {
                    nextRound()
                }
            } message: {
                Text(alertMessage)
            }
            .alert(alertTitle, isPresented: $isGameOver) {
                NavigationLink("Start new game", destination: ContentView())
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func startGame() {
        isGameOver = false
        guard gameData.startNumber < gameData.endNumber else {
            alertTitle = "Wrong numbers"
            alertMessage = "Start number can't be greater end number"
            return
        }
        gameData.roundCount += 1
        
        randomNumber1 = Int.random(in: Int(gameData.startNumber)...Int(gameData.endNumber))
        randomNumber2 = Int.random(in: Int(gameData.startNumber)...Int(gameData.endNumber))
        
    }
    
    func nextRound() {
        
        if gameData.roundCount >= Int(gameData.rounds) {
            isGameOver = true
            return
        }
        
        gameData.roundCount += 1
        
        randomNumber1 = Int.random(in: Int(gameData.startNumber)...Int(gameData.endNumber))
        randomNumber2 = Int.random(in: Int(gameData.startNumber)...Int(gameData.endNumber))
        
        
        let correctAnswer = randomNumber1 * randomNumber2
        
        if Int(answer) == correctAnswer {
            alertTitle = "Correct answer"
            alertMessage = "You right!"
            gameData.score += 1
        } else {
            alertTitle = "Wrong answer"
            alertMessage = "Nope, correct answer is: \(correctAnswer)"
        }
        haveAnswer = true
        answer = ""
    }
    
    func endGame() {
        alertTitle = "Game is over"
        alertMessage = "You'r score is \(gameData.score) in \(gameData.rounds) rounds"
        gameData.startNumber = 1.0
        gameData.endNumber = 1.0
        gameData.rounds = 1.0
        gameData.roundCount = 0
        gameData.score = 0
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameData: GameData())
    }
}

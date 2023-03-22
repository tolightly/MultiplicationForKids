//
//  GameData.swift
//  MultiplicationForKids
//
//  Created by Denys Nazymok on 19.03.2023.
//

import Foundation

class GameData: ObservableObject {
    @Published var startNumber = 1.0
    @Published var endNumber = 1.0
    @Published var rounds = 1.0
    @Published var roundCount = 0
    @Published var score = 0
    
    init(startNumber: Double = 1.0, endNumber: Double = 1.0, rounds: Double = 1.0) {
        self.startNumber = startNumber
        self.endNumber = endNumber
        self.rounds = rounds
    }
}

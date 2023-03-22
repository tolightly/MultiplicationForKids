//
//  QuestArray.swift
//  MultiplicationForKids
//
//  Created by Denys Nazymok on 20.03.2023.
//

import Foundation

class QuestArray: ObservableObject {
    @Published var arrayGameNumbers: [Int]
    
    init(arrayGameNumbers: [Int]) {
        self.arrayGameNumbers = arrayGameNumbers
    }
}

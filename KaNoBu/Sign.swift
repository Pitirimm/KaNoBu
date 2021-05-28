//
//  Sign.swift
//  KaNoBu
//
//  Created by Yuriy Martinovskiy on 28.05.2021.
//

import Foundation
import GameplayKit

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return "👋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        }
    }
    
    func getResult(for oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
             (.scissors, .paper),
             (.paper, .rock):
            return .win
        case (.rock, .paper),
             (.scissors, .rock),
             (.paper, .scissors):
            return .lose
        default:
            return .lose
        }
    }
}

//let randomChoice = Int.random(in: 0...2)
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else {
        return .scissors
    }
}

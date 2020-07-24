//
//  Sign.swift
//  RPS
//
//  Created by ZhangTommy on 24/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue:0 ,highestValue: 2)

enum Sign {
    case rock
    case scissors
    case paper
    var emoji:String {
        if self == .rock {
            return "👊"
        } else if self == .scissors {
            return "✌️"
        } else {
            return "✋"
        }
    }
    
    func compare(_ opposite:Sign) -> GameState {
        if self == opposite {
            return .draw
        }else if self == .rock && opposite == .scissors || self == .paper && opposite == .rock || self == .scissors && opposite == .paper {
            return .win
        }
        return .lose
    }
}

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    switch sign {
    case 0:
        return .rock
    case 1:
        return .paper
    default:
        return .scissors
    }
    
}

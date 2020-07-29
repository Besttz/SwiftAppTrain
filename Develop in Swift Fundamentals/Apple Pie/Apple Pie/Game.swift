//
//  Game.swift
//  Apple Pie
//
//  Created by ZhangTommy on 29/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var roundRemain: Int
    var guessed: [Character]
    var formatted: String {
        var result = ""
        for letters in word {
            if guessed.contains(letters) {
                result += "\(letters) "
            } else {
                result += "_ "
            }
        }
        return result
    }
    var win: Bool {
        for letters in word {
            if !guessed.contains(letters) {
                return false
            }
        }
        return true
    }
    
    mutating func guess(_ letter: Character) {
        guessed.append(letter)
        if !word.contains(letter) {
            roundRemain -= 1
        }
    }
}

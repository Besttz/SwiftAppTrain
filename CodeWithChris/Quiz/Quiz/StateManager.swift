//
//  StateManager.swift
//  Quiz
//
//  Created by ZhangTommy on 6/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation

class StateManager {
    
    static var numCorrectKey  = "numCorrect"
    static var questionIntKey  = "questionInt"
    
    static func saveState(numCorrect:Int, questionInt:Int) {
        let defaults =  UserDefaults.standard
        
        defaults.set(numCorrect, forKey: numCorrectKey )
        defaults.set(questionInt, forKey: questionIntKey)
    }
    
    static func retrieveValue(key:String) -> Any? {
        let defaults =  UserDefaults.standard
        
        return defaults.value(forKey: key)
    }
    
    static func clear() {
        let defaults =  UserDefaults.standard
        defaults.removeObject(forKey: numCorrectKey)
        defaults.removeObject(forKey: questionIntKey)
    }
}

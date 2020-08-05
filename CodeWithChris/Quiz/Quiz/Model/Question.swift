//
//  Question.swift
//  Quiz
//
//  Created by ZhangTommy on 5/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation

struct Question: Codable {
    
    var question:String?
    var answers:[String]
    var correctAnswerIndex:Int
    var feedback:String
    
}

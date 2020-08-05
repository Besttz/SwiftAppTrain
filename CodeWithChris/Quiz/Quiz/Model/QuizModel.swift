//
//  QuizModel.swift
//  Quiz
//
//  Created by ZhangTommy on 5/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation

protocol QuizProtocol {
    func quizRetrive(_ questions:[Question])
}
class QuizModel {
    
    var delegate:QuizProtocol?
    func getQuestion() {
        // Fetch the Questions
        
        // Notify the delegate
        delegate?.quizRetrive([Question]())
    }
}

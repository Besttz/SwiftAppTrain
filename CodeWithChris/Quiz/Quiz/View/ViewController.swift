//
//  ViewController.swift
//  Quiz
//
//  Created by ZhangTommy on 5/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QuizProtocol {
    
    

    var model = QuizModel()
    var questions = [Question]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        model.getQuestion()
    }

    func quizRetrive(_ questions: [Question]) {
        print("Question retrieved")
    }

}


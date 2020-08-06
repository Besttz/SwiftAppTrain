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
//        getLocalJSON()
                getRemoteJSON()
        // Notify the delegate
        //        delegate?.quizRetrive([Question]())
    }
    
    func getLocalJSON()  {
        let path = Bundle.main.path(forResource: "QuestionData", ofType: "json")
        guard path != nil else {
            print("Can't getLocalJSON")
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            
            let jsonDecoder = JSONDecoder()
            let qs = try jsonDecoder.decode([Question].self, from: data)
            
            delegate?.quizRetrive(qs)
        } catch  {
            print("Something Wrong")
        }
    }
    
    func getRemoteJSON() {
        
        // Create a URL object
        let url = URL(string: "https://codewithchris.com/code/QuestionData.json")
        
        guard url != nil else {
            print("Couldn't form URL object")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let qs = try jsonDecoder.decode([Question].self, from: data!)
                    
                    // Use the main thread to notify the UIview
                    DispatchQueue.main.async {
                        self.delegate?.quizRetrive(qs)
                    }
                    
                } catch  {
                    print("Something Wrong")
                }
            }
        }
        
        dataTask.resume()
    }
}

//
//  ViewController.swift
//  Quiz
//
//  Created by ZhangTommy on 5/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QuizProtocol, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var model = QuizModel()
    var questions = [Question]()
    var index = 0
    
    var resultDialog:ResultViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultDialog = storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultViewController
        resultDialog?.modalPresentationStyle = .overCurrentContext
        // Set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        model.getQuestion()
    }
    
    func displayQ() {
        guard questions.count > 0 && index < questions.count else  {
            return
        }
        questionLabel.text = questions[index].question
        tableView.reloadData()
        
    }
    
    func quizRetrive(_ questions: [Question]) {
        // Get a reference to the question
        self.questions = questions
        // Reload the tableview
        displayQ()
        print("Question retrieved")
    }
    
    // MARK: -TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard questions.count>0 else {
            return 0
        }
        // Return the number of answers of current question
        if let ques = questions[index].answers  {
            return ques.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        // Customize
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {
            if let answer =  questions[index].answers?[indexPath.row] {
                label!.text = answer
            }
            
        } 
        
        // Return
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Check if the selected answer is right
        let q = questions[index]
        
        if q.correctAnswerIndex == indexPath.row {
            // Correct
            print("Correct")
        } else {
            // Wrong
            print("Not Correct")
            
        }
        
        // Show Pop
        if resultDialog != nil {
            present(resultDialog!, animated: true, completion: nil)
        }
        
        // Check any question remain
        
        index += 1
        if index < questions.count {
            displayQ()
        } else {
            
        }
        
    }
    
}


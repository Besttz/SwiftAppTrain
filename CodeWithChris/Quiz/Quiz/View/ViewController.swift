//
//  ViewController.swift
//  Quiz
//
//  Created by ZhangTommy on 5/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QuizProtocol, UITableViewDelegate, UITableViewDataSource, ResultViewControllerProtocol {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var rootStackV: UIStackView!
    
    @IBOutlet weak var stackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTrailingConstraint: NSLayoutConstraint!
    
    var model = QuizModel()
    var questions = [Question]()
    var index = 0
    var correct = 0
    
    var resultDialog:ResultViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultDialog = storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultViewController
        resultDialog?.modalPresentationStyle = .overCurrentContext
        resultDialog?.delegate = self
        // Set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        model.getQuestion()
        
    }
    
    func questionSlideIn() {
        // Set Initial State
        stackViewLeadingConstraint.constant = 1000
        stackViewTrailingConstraint.constant = -1000
        rootStackV.alpha = 0
        view.layoutIfNeeded()
        // Animated
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.stackViewLeadingConstraint.constant = 0
            self.stackViewTrailingConstraint.constant = 0
            self.rootStackV.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func questionSlideOut() {
        // Set Initial State
        stackViewLeadingConstraint.constant = 0
        stackViewTrailingConstraint.constant = 0
        rootStackV.alpha = 1
        view.layoutIfNeeded()
        // Animated
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.stackViewLeadingConstraint.constant = -1000
            self.stackViewTrailingConstraint.constant = 1000
            self.rootStackV.alpha = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func displayQ() {
        guard questions.count > 0 && index < questions.count else  {
            return
        }
        questionLabel.text = questions[index].question
        tableView.reloadData()
        
        DispatchQueue.main.async {
            self.questionSlideIn()
        }
    }
    
    func quizRetrive(_ questions: [Question]) {
        // Get a reference to the question
        self.questions = questions
        
        // Check if State saved
        let saveIndex = StateManager.retrieveValue(key: StateManager.questionIntKey) as? Int
        if saveIndex != nil && saveIndex! < questions.count {
            index = saveIndex!
        }
        let saveCorrect = StateManager.retrieveValue(key: StateManager.numCorrectKey) as? Int
        if saveCorrect != nil && saveCorrect! <= questions.count {
            correct = saveCorrect!
        }
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
        let titleText: String
        
        if q.correctAnswerIndex == indexPath.row {
            // Correct
            print("Correct")
            titleText = "Correct"
            correct += 1
        } else {
            // Wrong
            print("Not Correct")
            titleText = "Sorry"
        }
        
        DispatchQueue.main.async {
            self.questionSlideOut()
        }
        
        // Show Pop
        if resultDialog != nil {
            resultDialog!.feedbackText = q.feedback!
            resultDialog!.titleText = titleText
            resultDialog!.buttonText = "Next"
            
            DispatchQueue.main.async {
                self.present(self.resultDialog!, animated: true, completion: nil)
            }
            
        }
        
    }
    
    func dialogDismissed() {
        // Check any question remain
        
        index += 1
        if index < questions.count {
            displayQ()
            
            // Save State
            StateManager.saveState(numCorrect: correct, questionInt: index )
        } else if index == questions.count {
            // Show a summary dialog
            // Show Pop
            if resultDialog != nil {
                resultDialog!.feedbackText = "You got \(correct) correct out of \(questions.count) questions!"
                resultDialog!.titleText = "Congratulations!"
                resultDialog!.buttonText = "Restart"
                
                present(resultDialog!, animated: true, completion: nil)
            }
            StateManager.clear()
        } else {
            index = 0
            correct = 0
            
            displayQ()
            
        }
    }
    
}


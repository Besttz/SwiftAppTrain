//
//  NameViewController.swift
//  PersonalityQuiz
//
//  Created by ZhangTommy on 2/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let name = nameField.text else {
            return
        }
        if name.lowercased().contains("zhenyu") || name.lowercased().contains("fan") || name.lowercased().contains("chuan") || name.lowercased().contains("zhao") {
            let homeView = segue.destination as!QuestionViewController
            homeView.questions = []
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

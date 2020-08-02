//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by ZhangTommy on 2/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

//
//  ResultViewController.swift
//  Quiz
//
//  Created by ZhangTommy on 5/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var dimV: UIView!
    @IBOutlet weak var dialogV: UIView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var feedbackL: UILabel!
    @IBOutlet weak var nextB: UIButton!
    
    var titleText = ""
    var feedbackText = ""
    var buttonText = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        titleL.text = titleText
        feedbackL.text = feedbackText
        nextB.setTitle(buttonText, for: .normal)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
    }
    
   
}

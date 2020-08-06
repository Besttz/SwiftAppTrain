//
//  ResultViewController.swift
//  Quiz
//
//  Created by ZhangTommy on 5/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

protocol ResultViewControllerProtocol {
    func dialogDismissed()
}

class ResultViewController: UIViewController {

    @IBOutlet weak var dimV: UIView!
    @IBOutlet weak var dialogV: UIView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var feedbackL: UILabel!
    @IBOutlet weak var nextB: UIButton!
    
    var titleText = ""
    var feedbackText = ""
    var buttonText = ""
    
    var delegate:ResultViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialogV.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleL.text = titleText
        feedbackL.text = feedbackText
        nextB.setTitle(buttonText, for: .normal)
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
        // Notify delegate
        delegate?.dialogDismissed()
        
    }
    
   
}

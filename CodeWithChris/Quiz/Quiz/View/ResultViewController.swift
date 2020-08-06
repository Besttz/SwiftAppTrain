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
        
        // Hide the elements
        dimV.alpha = 0
        titleL.alpha = 0
        feedbackL.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.dimV.alpha = 1
            self.titleL.alpha = 1
            self.feedbackL.alpha = 1
            
        }, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
        
        // Fade out this view
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.dimV.alpha = 0
            self.titleL.alpha = 0
            self.feedbackL.alpha = 0
        }) { (completed) in
            self.dismiss(animated: true, completion: nil)
            // Notify delegate
            self.delegate?.dialogDismissed()
                   
        }
        
       
    }
    
   
}

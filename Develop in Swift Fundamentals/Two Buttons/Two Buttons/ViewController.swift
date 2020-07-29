//
//  ViewController.swift
//  Two Buttons
//
//  Created by ZhangTommy on 29/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func setTapped(_ sender: UIButton) {
        label.text = field.text
    }
    @IBAction func clerTapped(_ sender: Any) {
        field.text = "Cleared"
        label.text = field.text
    }
    

}


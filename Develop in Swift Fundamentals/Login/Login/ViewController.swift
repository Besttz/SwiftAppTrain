//
//  ViewController.swift
//  Login
//
//  Created by ZhangTommy on 30/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var fUButton: UIButton!
    @IBOutlet weak var fPButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {
            return
        }
        if sender == fUButton {
            segue.destination.navigationItem.title = "F  U"
        } else if sender == fPButton {
            segue.destination.navigationItem.title = "F  P"
        } else {
            segue.destination.navigationItem.title = name.text
        }
    }
    
    @IBAction func fUTapped(_ sender: Any) {
        performSegue(withIdentifier: "submit", sender: sender)
    }
    @IBAction func fPTapped(_ sender: Any) {
        performSegue(withIdentifier: "submit", sender: sender)
    }
    
}


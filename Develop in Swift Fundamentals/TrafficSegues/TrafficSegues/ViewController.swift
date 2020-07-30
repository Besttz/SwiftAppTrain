//
//  ViewController.swift
//  TrafficSegues
//
//  Created by ZhangTommy on 30/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yBT(_ sender: Any) {
        if segueSwitch.isOn {
            performSegue(withIdentifier: "Ye", sender: nil)
        }
    }
    @IBAction func gBT(_ sender: Any) {
        if segueSwitch.isOn {
            performSegue(withIdentifier: "Gr", sender: nil)
        }
    }
    
//    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.destination.navigationItem.title = textField.text
//    }
    
}


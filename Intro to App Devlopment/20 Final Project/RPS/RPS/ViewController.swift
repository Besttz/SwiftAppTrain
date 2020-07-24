//
//  ViewController.swift
//  RPS
//
//  Created by ZhangTommy on 24/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var icon: UILabel!
    @IBOutlet weak var maiTitle: UILabel!
    @IBOutlet weak var rIcon: UIButton!
    @IBOutlet weak var sIcon: UIButton!
    @IBOutlet weak var pIcon: UIButton!
    @IBOutlet weak var paButton: UIButton!
    
    @IBAction func tapR(_ sender: Any) {
    }
    @IBAction func tapS(_ sender: Any) {
    }
    @IBAction func taP(_ sender: Any) {
    }
    @IBAction func paButton(_ sender: Any) {
    }
    
    func action()  {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        paButton.isEnabled = false
    }


}


//
//  ViewController.swift
//  Apple Pie
//
//  Created by ZhangTommy on 29/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func letterPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    
}


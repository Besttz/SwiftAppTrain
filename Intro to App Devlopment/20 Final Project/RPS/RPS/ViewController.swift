//
//  ViewController.swift
//  RPS
//
//  Created by ZhangTommy on 24/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user:Sign?
    
    @IBOutlet weak var icon: UILabel!
    @IBOutlet weak var maiTitle: UILabel!
    @IBOutlet weak var rIcon: UIButton!
    @IBOutlet weak var sIcon: UIButton!
    @IBOutlet weak var pIcon: UIButton!
    @IBOutlet weak var paButton: UIButton!
    //    @IBOutlet var background: UIView!
    
    @IBAction func tapR(_ sender: Any) {
        user = .rock
        action()
    }
    @IBAction func tapS(_ sender: Any) {
        user = .scissors
        action()
    }
    @IBAction func taP(_ sender: Any) {
        user = .paper
        action()
    }
    @IBAction func paButton(_ sender: Any) {
        rIcon.isHidden = false
        pIcon.isHidden = false
        sIcon.isHidden = false
        pIcon.isEnabled = true
        rIcon.isEnabled = true
        sIcon.isEnabled = true
        maiTitle.text = "Hello!"
        icon.text = "🤖"
         paButton.isEnabled = false
        view.backgroundColor = UIColor.white
    }
    
    func action() {
        paButton.isEnabled = true
        if user == nil {
            return
        }
        let com = randomSign()
        let state = user?.compare(com)
        
        icon.text = com.emoji
        switch user {
        case .paper:
            rIcon.isHidden = true
            sIcon.isHidden = true
            pIcon.isEnabled = false
        case .rock:
            pIcon.isHidden = true
            sIcon.isHidden = true
            rIcon.isEnabled = false
        case .scissors:
            rIcon.isHidden = true
            pIcon.isHidden = true
            sIcon.isEnabled = false
        default:
            return
        }
        switch state {
        case .draw:
            maiTitle.text = "Come on and Try Again!"
            view.backgroundColor = UIColor.gray
        case .win:
            maiTitle.text = "Yeaa!"
            view.backgroundColor = UIColor.green
        case .lose:
            maiTitle.text = "Opps!"
            view.backgroundColor = UIColor.red
        default:
            return
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        paButton.isEnabled = false
    }
    
    
}


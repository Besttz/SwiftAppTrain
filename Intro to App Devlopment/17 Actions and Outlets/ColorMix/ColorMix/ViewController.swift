//
//  ViewController.swift
//  ColorMix
//
//  Created by ZhangTommy on 9/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var rSwitch: UISwitch!
    @IBOutlet weak var gSwitch: UISwitch!
    @IBOutlet weak var bSwitch: UISwitch!
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorView.backgroundColor = .black
    }
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if rSwitch.isOn {
            red = CGFloat(rSlider.value)
        }
        if gSwitch.isOn {
            green = CGFloat(gSlider.value)
        }
        if bSwitch.isOn {
            blue = CGFloat(bSlider.value)
        }
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    
}


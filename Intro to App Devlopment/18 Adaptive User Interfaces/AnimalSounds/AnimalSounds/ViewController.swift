//
//  ViewController.swift
//  AnimalSounds
//
//  Created by ZhangTommy on 18/7/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mSound = SimpleSound(named:"meow")
    let wSound = SimpleSound(named:"woof")
    let cSound = SimpleSound(named:"moo")
    
    @IBOutlet weak var animalSoundLabel: UILabel!
    
    @IBAction func catButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Meow!"
        mSound.play()
    }
    @IBAction func dogButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Woof!"
        wSound.play()
    }
    @IBAction func cowButtonTapped(_ sender: Any) {
        animalSoundLabel.text = "Moo!"
        cSound.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


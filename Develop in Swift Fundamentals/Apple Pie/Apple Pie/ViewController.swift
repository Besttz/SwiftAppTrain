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
    
    var  listOfWords = ["tommy","charles","fan","sumit","zhenyu","apple","questionmark"]
    let gameRound = 7
    var lives = 5
    
    var currentGame: Game!
    
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRound()
    }

    @IBAction func letterPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = Character(sender.title(for: .normal)!.lowercased())
        currentGame.guess(letter)
        updateState()
    }
    
    func newRound()  {
        if !listOfWords.isEmpty {
            let newWord =  listOfWords.removeFirst()
            currentGame = Game(word: newWord, roundRemain: gameRound, guessed: [])
            updateUI()
            resetKeyboard(true)
        } else {
            showAlert(title: "Congratulations!", message: "Claim your rewards from Tommy!")
            resetKeyboard(false)
        }
        
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        present(alert,animated: true)
    }
    
    func resetKeyboard(_ enable: Bool) {
        for button in buttons {
            button.isEnabled = enable
        }
    }
    
    func updateUI()  {
        wordLabel.text = currentGame.formatted.uppercased()
        scoreLabel.text = "Remaining Heart: \(lives)"
        treeImage.image = UIImage(named: "Tree \(currentGame.roundRemain)")
    }
    
    func updateState()  {
        if currentGame.roundRemain == 0 {
            lives -= 1
            currentGame = Game(word: currentGame.word, roundRemain: gameRound, guessed: [])
            resetKeyboard(true)
        } else if currentGame.win {
            newRound()
        }
        updateUI()
    }
}


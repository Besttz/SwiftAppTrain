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
    
    var  listOfWords = ["tommy","charles","fan","sumit","zhenyu","apple","ios"]
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
        let newWord =  listOfWords.removeFirst()
        currentGame = Game(word: newWord, roundRemain: gameRound, guessed: [])
        updateUI()
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
        } else if currentGame.win {
            newRound()
        }
        updateUI()
    }
}


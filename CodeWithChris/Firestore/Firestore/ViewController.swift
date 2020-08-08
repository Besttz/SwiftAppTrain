//
//  ViewController.swift
//  Firestore
//
//  Created by ZhangTommy on 8/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
//import FirebaseCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let db = Firestore.firestore()
        
//        db.collection("game").addDocument(data: ["name" : "Super Mario World","platform" : "Super Nintendo","genre" : "Platformer"])
        
//        db.collection("game").document("tetris").setData(["name" : "Tetris","platform" : "Nintendo","genre" : "Puzzle"])
        
    }


}


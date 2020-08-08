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
        
        
        /* // Create Collection/Documents
         
         db.collection("game").addDocument(data: ["name" : "Super Mario World","platform" : "Super Nintendo","genre" : "Platformer"])
         
         db.collection("consoles").addDocument(data: ["name" : "Super Mario World","platform" : "Super Nintendo","genre" : "Platformer"])
         
         db.collection("consoles").document("snes").setData(["name" : "Super Nintendo Entertainment System","company" : "Nintendo"])
         
         db.collection("consoles").document("nes").setData(["name" : "Nintendo Entertainment System","company" : "Nintendo"])
         */
        
        /* // Update Objects
         db.collection("game").document("PdcaZACx2wSM4OKar2JE").setData([ "platform":"SNES", "rating" : "E", "year" : "1990"], merge: true)
         db.collection("consoles").document("snes").setData([ "name":"Super NES", "units" : "49 million", "year" : "1990"], merge: true)
         */
        
        /*// Delete Object
         db.collection("game").document("PdcaZACx2wSM4OKar2JE").setData([ "genre":FieldValue.delete()], merge: true)
         db.collection("consoles").document("snes").delete()
         */
        
        /* // Read Obj
         db.collection("consoles").document("nes").getDocument { (doc, error) in
         if doc != nil && error == nil  {
         print(doc?.data() ?? "Empty Doc")
         }
         }
         
         db.collection("game").getDocuments { (docs, error) in
         if docs != nil && error == nil  {
         for doc in docs!.documents {
         print(doc.data())
         }
         }
         }
         */
        
        // Listener
        let docListener = db.collection("game").document("tetris").addSnapshotListener { (docSnap, error) in
            if docSnap != nil && error == nil && docSnap!.data() != nil  {
                print(docSnap!.data()!)
            }
        }
        
        //        docListener.remove()
        
        let coListener = db.collection("consoles").addSnapshotListener { (querySnap, error) in
            
            if querySnap != nil && error == nil  {
                for change in querySnap!.documentChanges {
                    print(change.document.data())
                }
            }
        }
        //        coListener.remove()
    }
    
    
}


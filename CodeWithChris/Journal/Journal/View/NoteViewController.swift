//
//  NoteViewController.swift
//  Journal
//
//  Created by ZhangTommy on 9/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var titleV: UITextField!
    @IBOutlet weak var textV: UITextView!
    @IBOutlet weak var starB: UIButton!
    @IBOutlet weak var segueToHOme: UITextView!
    
    var note:Note?
    private var model = NoteModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if note != nil {
            titleV.text = note!.title
            textV.text = note!.body
        } else {
            titleV.text = nil
            textV.text = "..."
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        if note != nil {
            model.deleteNotes(note: note!)
        }
        // Close the popup
        
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        if note != nil {
            // Check if changed
            if note!.body != textV.text || note!.title != titleV.text {
                note!.lastUpdatedAt = Date()
            }
                        
            // Update the note
            note!.title = titleV.text ?? "No Title"
            note!.body = textV.text ?? "No Content"
            
            // Test
//            note!.docId = UUID().uuidString
            
        } else {
            note = Note(docId: UUID().uuidString, title: titleV.text ?? "No Title", body: textV.text ?? "No Content", isStarred: false, createdAt: Date(), lastUpdatedAt: Date())
        }
        // Save the note
        model.save(note: note!)
        // Close the popup
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! ViewController
//        vc.refresh()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension NoteViewController{
    //隐藏键盘
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NoteViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

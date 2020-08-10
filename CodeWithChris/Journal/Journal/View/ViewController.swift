//
//  ViewController.swift
//  Journal
//
//  Created by ZhangTommy on 9/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var notes = [Note]()
    private var model = NoteModel()
        
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        model.getNotes()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let titleL = cell.viewWithTag(1) as! UILabel
        let bodyL = cell.viewWithTag(2) as! UILabel
        titleL.text = notes[indexPath.row].title
        bodyL.text = notes[indexPath.row].body

        
        return cell
    }
    
    
}

extension ViewController:NoteModelProtocol {
    func getNotes(notes: [Note]) {
        self.notes = notes
        tableView.reloadData()
    }
    
    
    
}

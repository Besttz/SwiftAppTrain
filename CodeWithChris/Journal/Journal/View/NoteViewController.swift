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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
    }
    
    @IBAction func doneTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

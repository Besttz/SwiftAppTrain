//
//  DetailViewController.swift
//  News
//
//  Created by ZhangTommy on 7/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webV: WKWebView!
    
    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        if url != nil {
            guard let urlObject =  URL(string: url!) else {
                return
            }
            webV.load(URLRequest(url:urlObject))
        }
    }

}

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
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webV.navigationDelegate = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
        if url != nil {
            guard let urlObject =  URL(string: url!) else {
                return
            }
            
            spiner.alpha = 1
            spiner.startAnimating()

            webV.load(URLRequest(url:urlObject))
        }
    }

}

extension DetailViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Stop the spinner
        spiner.startAnimating()
        spiner.alpha = 0
    }
}

//
//  ViewController.swift
//  News
//
//  Created by ZhangTommy on 7/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableV: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableV.delegate = self
        tableV.dataSource = self
        
        model.delegate = self
        
        model.getArticles()
        
    }
    
}


extension ViewController: ArticleModelProtocol {
    
    // MARK: - ArticleModel Protocol Methods
    func articlesRetrived(_ articles: [Article]) {
        print("ViewController: articlesRetrived from model")
        self.articles = articles
        
        tableV.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a Cell
        let cell = tableV.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        // Customize
        
        // Return
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


//
//  ArticleModel.swift
//  News
//
//  Created by ZhangTommy on 7/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrived(_ articles:[Article ])
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles()  {
        // Get the JSON from API
        
        // Create a URL object
        let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2020-08-06&to=2020-08-06&sortBy=popularity&apiKey=006d66f8939a46d09b410a49a79b6d0c")
        
        guard url != nil else {
            print("Couldn't form URL object")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let articles = try jsonDecoder.decode(ArticleService.self, from: data!)
                    
                    // Use the main thread to notify the UIview
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrived(articles.articles!)
                    }
                    
                } catch  {
                    print("Something Wrong")
                }
            }
        }
        
        dataTask.resume()
        // Parse the JSON and pass back to the view controller
//        delegate?.articlesRetrived([Article]())
    }
}

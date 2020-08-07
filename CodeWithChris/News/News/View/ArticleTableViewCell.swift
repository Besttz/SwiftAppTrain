//
//  ArticleTableViewCell.swift
//  News
//
//  Created by ZhangTommy on 7/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    var articleToDisplay: Article?
    
    func displayA(_ article:Article){
        
        // Clean uo the cell
        imageV.image = nil
        titleL.text  = nil
        
        articleToDisplay = article
        
        // Set the title
        titleL.text  = articleToDisplay!.title
        
        // Check if it has an image
        
        guard let imageUrl = articleToDisplay!.urlToImage  else {
            return
        }
        
        // Check if this image cached
        
        if let image = CacheManager.load(imageUrl) {
            self.imageV.image = UIImage(data: image)
            return
        }
        // Download the img
        
        // Create a URL object
        let url = URL(string:imageUrl)
        guard url != nil else {
            print("Couldn't form URL object")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check Errors and Data
            if error == nil && data != nil{
                
                // Cache the image
                CacheManager.save(url: imageUrl, imageData: data!)
                
                // Check if the image is for this article
                if self.articleToDisplay!.urlToImage == imageUrl {
                    DispatchQueue.main.async {
                        // Display the image
                        self.imageV.image = UIImage(data: data!)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

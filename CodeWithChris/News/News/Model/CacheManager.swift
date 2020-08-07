//
//  CacheManager.swift
//  News
//
//  Created by ZhangTommy on 7/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var images = [String:Data]()
    
    static func save(url:String,imageData:Data){
        
        images[url] = imageData
    }
    
    static func load(_ url:String) -> Data? {
        return images[url] 
    }
}

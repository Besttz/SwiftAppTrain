//
//  Article.swift
//  News
//
//  Created by ZhangTommy on 7/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation

struct Article:Codable {
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
}

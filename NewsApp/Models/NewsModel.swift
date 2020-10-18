//
//  NewsModel.swift
//  NewsApp
//
//  Created by Kabdolla on 10/14/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String
    let publishedAt: String
    let content: String?
    
    var imgUrl: URL? {
        return URL(string: urlToImage)
    }
}

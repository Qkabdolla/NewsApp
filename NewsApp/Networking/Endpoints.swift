//
//  Endpoints.swift
//  NewsApp
//
//  Created by Kabdolla on 10/14/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Alamofire

public protocol EndPointType {
    var scheme: String { get }
    var httpMethod: HTTPMethod { get }
    var host: String { get }
    var path: String { get }
    var params: [String: String] { get }
}

enum Endpoints {
    case newsFeed
    case topNewsFeed
}
    
extension Endpoints: EndPointType {
    var scheme: String {
        switch self {
        case .newsFeed, .topNewsFeed:
            return "https"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .newsFeed, .topNewsFeed:
            return .get
        }
    }
    
    var host: String {
        switch self {
        case .newsFeed, .topNewsFeed:
            return "newsapi.org"
        }
    }
    
    var path: String {
        switch self {
        case .newsFeed:
            return "/v2/everything"
        case .topNewsFeed:
            return "/v2/top-headlines"
        }
    }
    
    var params: [String: String] {
        switch self {
        case .newsFeed, .topNewsFeed:
            return ["q": "apple"]
        }
    }
}

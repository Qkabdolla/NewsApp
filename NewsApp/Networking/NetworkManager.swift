//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Kabdolla on 10/14/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    private let parser: Parser
    private var manager: Session?
    
    init() {
        self.parser = DecodeParser()
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        manager = Session(configuration: configuration)
    }
     
    func makeRequest<T: Decodable>(endpoint: EndPointType, page: String = "1", completion: @escaping (Result<T>) -> Void) {
        
        var allParams = endpoint.params
        allParams["page"] = page
        allParams["pageSize"] = "20"
        allParams["apiKey"] = "e65ee0938a2a43ebb15923b48faed18d"
        guard let url = self.url(from: endpoint, params: allParams) else { return }
        
        manager?.request(url, method: endpoint.httpMethod, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON { (response) in
            completion(self.parser.parse(response: response))
        }
    }
    
    private func url(from path: EndPointType, params: [String: String]) -> URL? {
        var components = URLComponents()
        components.scheme = path.scheme
        components.host = path.host
        components.path = path.path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url
    }
}

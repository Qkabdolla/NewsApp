//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Kabdolla on 10/15/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Foundation

protocol NewsViewModelDelegate: class {
    func updateView()
}

class NewsViewModel {
    
    private let manager: NetworkManager = NetworkManager()
    private var data = [News]()
    private var page = 2
    
    weak var delegate: NewsViewModelDelegate?
    
    func getNews(endpoint: Endpoints) {
        manager.makeRequest(endpoint: endpoint) { [weak self] (result: Result<NewsResponse>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let result):
                switch endpoint {
                case .topNewsFeed:
                    self?.handleChanges(newData: result.articles)
                default:
                    self?.data = result.articles
                }
                self?.delegate?.updateView()
            }
        }
    }
    
    func getMoreNews(endpoint: Endpoints) {
        manager.makeRequest(endpoint: endpoint, page: "\(page)") { [weak self] (result: Result<NewsResponse>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let result):
                self?.data.append(contentsOf: result.articles)
                self?.delegate?.updateView()
                self?.page += 1
            }
        }
    }
    
    private func handleChanges(newData: [News]) {
        if data.count == 0 {
            data = newData
            return
        }        
        var indexArray: [Int] = []

        for index in 0..<5 {
            if data[0].title != newData[index].title {
                indexArray.append(index)
            } else {
                break
            }
        }
        
        if indexArray.count == 0 { return }
        indexArray.reverse()
        indexArray.forEach { index in
            data.insert(newData[index], at: 0)
        }
    }
    
    func getOneNews(index: Int) -> News {
        return data[index]
    }
    
    func getNumberOfNews() -> Int {
        return data.count
    }
}

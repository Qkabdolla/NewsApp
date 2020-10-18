//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Kabdolla on 10/16/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    let news: News
    let numberOfRows: Int = 2
    
    init(news: News) {
        self.news = news
    }
    
    func saveNews() {
        let data = DBNewsModel(item: news)
        RealmService.shared.create(data)
    }
    
    func isSaved() -> Bool {
        return RealmService.shared.isSaved(title: news.title ?? "")
    }
    
    func deleteNews() {
        RealmService.shared.delete(title: news.title ?? "")
    }
}

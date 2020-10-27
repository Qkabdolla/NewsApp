//
//  SavedViewModel.swift
//  NewsApp
//
//  Created by Kabdolla on 10/17/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Foundation

class SavedViewModel {
    
    private var data = [News]()
    
    weak var delegate: NewsViewModelDelegate?
    
    func getNews() {
        data = []
        let news = RealmService.shared.fetch()
        
        news.forEach { item in
            guard let items = item as? DBNewsModel else { return }
            let oneNews = News(author: items.author,
                               title: items.title,
                               description: items.shortContent,
                               urlToImage: items.image,
                               publishedAt: items.date,
                               content: items.content)
            data.append(oneNews)
        }
        
        delegate?.updateView()
    }
    
    func getOneNews(index: Int) -> News {
        return data[index]
    }
    
    func getNumberOfNews() -> Int {
        return data.count
    }
}

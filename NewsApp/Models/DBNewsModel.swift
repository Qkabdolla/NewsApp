//
//  DBNewsCell.swift
//  NewsApp
//
//  Created by Kabdolla on 10/16/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import RealmSwift

class DBNewsModel: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var shortContent: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var image: String = ""
    
    override class func primaryKey() -> String? {
        return #keyPath(title)
    }
    
    convenience init(item: News) {
        self.init()
        self.title = item.title ?? ""
        self.shortContent = item.description ?? ""
        self.date = ""
        self.author = item.author ?? ""
        self.content = item.content ?? ""
        self.image = item.urlToImage ?? ""
    }
}

//
//  Result+Ext.swift
//  NewsApp
//
//  Created by Kabdolla on 10/18/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray() -> [Any] {
        return self.map { $0 }
    }
}

extension RealmSwift.List {
    func toArray() -> [Any] {
        return self.map { $0 }
    }
}

//
//  DBManager.swift
//  NewsApp
//
//  Created by Kabdolla on 10/16/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import RealmSwift

class RealmService {
    
    private init() {}
    
    static let shared = RealmService()
    
    func create<T: Object>(_ object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(title: String) {
        do {
            let realm = try Realm()
            guard let object = realm.object(ofType: DBNewsModel.self, forPrimaryKey: title) else { return }
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetch() -> [Any] {
        do {
            let realm = try Realm()
            let objects = realm.objects(DBNewsModel.self)
            return objects.toArray()
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func isSaved(title: String) -> Bool {
        do {
            let realm = try Realm()
            return realm.object(ofType: DBNewsModel.self, forPrimaryKey: title) != nil
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}

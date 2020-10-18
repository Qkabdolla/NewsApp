//
//  Date+Ext.swift
//  NewsApp
//
//  Created by Kabdolla on 10/17/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Foundation

extension Date {
    static func getDate(fromString dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return dateFormatter.date(from: dateString) ?? Date()
    }
    
    static func getPrettyDateString(fromString dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        let date = getDate(fromString: dateString)
        
        return dateFormatter.string(from: date)
    }
    
    static func getPrettyDateString(fromDate date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        return dateFormatter.string(from: date)
    }
}

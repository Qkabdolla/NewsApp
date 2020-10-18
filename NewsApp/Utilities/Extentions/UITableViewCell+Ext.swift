//
//  TableViewCell+Ext.swift
//  NewsApp
//
//  Created by Kabdolla on 10/14/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableView { }

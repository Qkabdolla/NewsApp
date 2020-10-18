//
//  UIBarButtonItem+Ext.swift
//  NewsApp
//
//  Created by Kabdolla on 10/16/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    func set(selected: Bool) {
        tintColor = selected ? UIColor.red : UIColor.systemBlue
    }
}

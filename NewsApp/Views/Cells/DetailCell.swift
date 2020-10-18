//
//  DetailCell.swift
//  NewsApp
//
//  Created by Kabdolla on 10/15/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    // MARK: - Properties
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func configure(content: String?, author: String?, date: String) {
        contentLabel.text = content
        authorLabel.text = author
        dateLabel.text = Date.getPrettyDateString(fromString: date)
    }
    
    private func configureUI() {
        backgroundColor = .white
        selectionStyle = .none
        addSubviews([contentLabel, authorLabel, dateLabel])
        
        contentLabel.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor,
                            paddingTop: 12,
                            paddingLeft: 8,
                            paddingRight: 8)
        
        authorLabel.anchor(top: contentLabel.bottomAnchor,
                           left: leftAnchor,
                           bottom: bottomAnchor,
                           paddingTop: 8,
                           paddingLeft: 8,
                           paddingBottom: 12)
        
        dateLabel.anchor(top: contentLabel.bottomAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingTop: 8,
                         paddingBottom: 12,
                         paddingRight: 8)
    }
    
}

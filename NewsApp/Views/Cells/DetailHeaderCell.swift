//
//  DetailHeaderCell.swift
//  NewsApp
//
//  Created by Kabdolla on 10/16/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class DetailHeaderCell: UITableViewCell {
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    func configure(title: String?, imgUrl: URL?) {
        titleLabel.text = title
        mainImageView.kf.setImage(with: imgUrl)
    }
    
    private func configureUI() {
        backgroundColor = .white
        selectionStyle = .none
        addSubviews([titleLabel, mainImageView])
        
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingTop: 12,
                          paddingLeft: 8,
                          paddingRight: 8)
        mainImageView.anchor(top: titleLabel.bottomAnchor,
                             left: leftAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor,
                             paddingTop: 12,
                             paddingLeft: 8,
                             paddingBottom: 0,
                             paddingRight: 8,
                             height: 150)
    }
}

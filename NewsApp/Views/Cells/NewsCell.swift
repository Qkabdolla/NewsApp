//
//  NewsCell.swift
//  NewsApp
//
//  Created by Kabdolla on 10/14/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    // MARK: - Properties
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        descriptionLabel.text = ""
        authorLabel.text = ""
        mainImageView.image = nil
    }
    
    func configure(news: News) {
        titleLabel.text = news.title ?? ""
        descriptionLabel.text = news.description ?? ""
        authorLabel.text = news.author ?? ""
        dateLabel.text = Date.getPrettyDateString(fromString: news.publishedAt)
        mainImageView.kf.setImage(with: news.imgUrl)
    }
    
    private func configureUI() {
        backgroundColor = .white
        selectionStyle = .none
        addSubviews([mainImageView, titleLabel, descriptionLabel, dateLabel, authorLabel])
        
        mainImageView.anchor(top: topAnchor,
                             left: leftAnchor,
                             paddingTop: 12,
                             paddingLeft: 8,
                             width: 170,
                             height: 100)
        
        titleLabel.anchor(top: topAnchor,
                          left: mainImageView.rightAnchor,
                          right: rightAnchor,
                          paddingTop: 12,
                          paddingLeft: 8,
                          paddingRight: 8)
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor,
                                left: mainImageView.rightAnchor,
                                right: rightAnchor,
                                paddingTop: 8,
                                paddingLeft: 8,
                                paddingRight: 8)
        
        dateLabel.anchor(top: mainImageView.bottomAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingTop: 8,
                         paddingBottom: 12,
                         paddingRight: 8)
        
        authorLabel.anchor(top: mainImageView.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         paddingTop: 8,
                         paddingLeft: 8,
                         paddingBottom: 12)
    }
}

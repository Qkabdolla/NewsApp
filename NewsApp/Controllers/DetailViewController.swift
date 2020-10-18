//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Kabdolla on 10/14/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    // MARK: - Properties
    private lazy var barButtonItem = UIBarButtonItem(image: UIImage(named: Asset.Images.bookmarkRibbon.name),
                                                     style: .plain,
                                                     target: self,
                                                     action: #selector(didTapRightBarButtonItem(_:)))
    
    private let viewModel: DetailViewModel
    
    // MARK: - Lifecycle
    
    init(news: News) {
        self.viewModel = DetailViewModel(news: news)
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.set(selected: viewModel.isSaved())
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(DetailCell.self, forCellReuseIdentifier: DetailCell.defaultReuseIdentifier)
        tableView.register(DetailHeaderCell.self, forCellReuseIdentifier: DetailHeaderCell.defaultReuseIdentifier)
    }
    
    // MARK: - Selectors
    @objc private func didTapRightBarButtonItem(_ sender: UIBarButtonItem) {
        switch viewModel.isSaved() {
        case true:
            viewModel.deleteNews()
        case false:
            viewModel.saveNews()
        }
        barButtonItem.set(selected: viewModel.isSaved())
    }
}

extension DetailViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailHeaderCell.defaultReuseIdentifier, for: indexPath) as? DetailHeaderCell else { return UITableViewCell() }
            
            let news = viewModel.news
            cell.configure(title: news.title, imgUrl: news.imgUrl)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.defaultReuseIdentifier, for: indexPath) as? DetailCell else { return UITableViewCell() }
            
            let news = viewModel.news
            cell.configure(content: news.content, author: news.author, date: news.publishedAt)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//
//  ViewController.swift
//  NewsApp
//
//  Created by Kabdolla on 10/8/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class AllNewsViewController: UITableViewController {
    
    // MARK: - Properties
    weak var coordinator: AllNewsCoordinator?
    private let viewModel = NewsViewModel()
    
    private lazy var refresher: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresh
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        configureUI()
        configureTableView()
        getNews()
    }
    
    // MARK: - API
    private func getNews() {
        viewModel.getNews(endpoint: Endpoints.newsFeed)
    }
    
    // MARK: - Helpers
    private func configureUI() {
        title = L10n.moreNewsTitle
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.defaultReuseIdentifier)
        tableView.refreshControl = refresher
    }
    
    // MARK: - Selectors
    @objc private func handleRefresh() {
        getNews()
    }
}

extension AllNewsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfNews()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.defaultReuseIdentifier, for: indexPath) as? NewsCell else { return UITableViewCell() }
        let news = viewModel.getOneNews(index: indexPath.row)
        cell.configure(news: news)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.presentDetail(news: viewModel.getOneNews(index: indexPath.row))
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > scrollView.contentSize.height * 0.60 {
            viewModel.getMoreNews(endpoint: .newsFeed)
        }
    }
}

extension AllNewsViewController: NewsViewModelDelegate {
    func updateView() {
        tableView.reloadData()
        refresher.endRefreshing()
    }
}

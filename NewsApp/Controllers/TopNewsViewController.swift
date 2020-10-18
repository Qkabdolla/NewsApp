//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Kabdolla on 10/8/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class TopNewsViewController: UITableViewController {
    
    // MARK: - Properties
    private let viewModel = NewsViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        configureUI()
        configureTableView()
        getNews()
        configureTimer()
    }
    
    // MARK: - API
    @objc private func getNews() {
        viewModel.getNews(endpoint: Endpoints.topNewsFeed)
    }
    
    private func configureTimer() {
        _ = Timer.scheduledTimer(timeInterval: 10.0,
                                 target: self,
                                 selector: #selector(getNews),
                                 userInfo: nil,
                                 repeats: true)
    }
    
    // MARK: - Helpers
    private func configureUI() {
        navigationItem.title = L10n.newsTitle
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.defaultReuseIdentifier)
    }
}

extension TopNewsViewController {
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
        let viewController = DetailViewController(news: viewModel.getOneNews(index: indexPath.row))
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > scrollView.contentSize.height * 0.70 {
            viewModel.getMoreNews(endpoint: .topNewsFeed)
        }
    }
}

extension TopNewsViewController: NewsViewModelDelegate {
    func updateView() {
        tableView.reloadData()
    }
}

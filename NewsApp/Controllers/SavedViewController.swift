//
//  SavedViewController.swift
//  NewsApp
//
//  Created by Kabdolla on 10/17/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class SavedViewController: UITableViewController {
    
    // MARK: - Properties
    weak var coordinator: SavedCoordinator?
    private let viewModel = SavedViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        configureUI()
        configureTableView()
        getNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNews()
    }
    
    // MARK: - API
    private func getNews() {
        viewModel.getNews()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        title = L10n.savedTitle
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.defaultReuseIdentifier)
    }
    
    // MARK: - Selectors
    @objc private func handleRefresh() {
        viewModel.getNews()
        
    }
}

extension SavedViewController {
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
    
}

extension SavedViewController: NewsViewModelDelegate {
    func updateView() {
        tableView.reloadData()
    }
}

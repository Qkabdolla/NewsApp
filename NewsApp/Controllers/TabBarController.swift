//
//  TabBarController.swift
//  NewsApp
//
//  Created by Kabdolla on 10/8/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    let topNewsCoordinator = TopNewsCoordinator(navigationController: UINavigationController())
    let allNewsCoordinator = AllNewsCoordinator(navigationController: UINavigationController())
    let savedCoordinator = SavedCoordinator(navigationController: UINavigationController())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .black
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.black
    }
    
    private func configureViewControllers() {
        topNewsCoordinator.start()
        allNewsCoordinator.start()
        savedCoordinator.start()
        
        viewControllers = [topNewsCoordinator.navigationController,
                           allNewsCoordinator.navigationController,
                           savedCoordinator.navigationController]
    }
}

//
//  TabBarController.swift
//  NewsApp
//
//  Created by Kabdolla on 10/8/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
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
        
        let news = templateNavigationControllers(title: L10n.newsTitle,
                                                 image: UIImage(named: Asset.Images.literature.name),
                                                 rootVC: TopNewsViewController())
        let allNews = templateNavigationControllers(title: L10n.moreNewsTitle,
                                                    image: UIImage(named: Asset.Images.news.name),
                                                    rootVC: AllNewsViewController())
        let saved = templateNavigationControllers(title: L10n.savedTitle,
                                                  image: UIImage(named: Asset.Images.save.name),
                                                  rootVC: SavedViewController())
        
        viewControllers = [news, allNews, saved]
    }
    
    private func templateNavigationControllers(title: String, image: UIImage?, rootVC: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootVC)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
}

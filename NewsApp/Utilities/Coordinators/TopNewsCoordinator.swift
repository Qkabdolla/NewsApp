//
//  StartCoordinator.swift
//  NewsApp
//
//  Created by Kabdolla on 10/22/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class TopNewsCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = TopNewsViewController()
        viewController.coordinator = self
        navigationController.tabBarItem.image = UIImage(named: Asset.Images.literature.name)
        navigationController.tabBarItem.title = L10n.newsTitle
        navigationController.pushViewController(viewController, animated: false)
    }
}

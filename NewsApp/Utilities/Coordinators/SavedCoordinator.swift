//
//  SavedCoordinator.swift
//  NewsApp
//
//  Created by Kabdolla on 10/22/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

class SavedCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SavedViewController()
        viewController.coordinator = self
        navigationController.tabBarItem.image = UIImage(named: Asset.Images.save.name)
        navigationController.tabBarItem.title = L10n.savedTitle
        navigationController.pushViewController(viewController, animated: false)
    }
}

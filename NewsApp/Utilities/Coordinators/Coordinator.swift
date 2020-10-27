//
//  Coordinator.swift
//  NewsApp
//
//  Created by Kabdolla on 10/22/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    func presentDetail(news: News) {
        let viewController = DetailViewController(news: news)
        navigationController.pushViewController(viewController, animated: true)
    }
}

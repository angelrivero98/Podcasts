//
//  MainTabBarController.swift
//  Podcasts
//
//  Created by Romelys Rivero on 4/2/19.
//  Copyright © 2019 Angel Rivero. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple
        setupViewControllers()
    }
    
    //MARK:- Setup Functions
    private func setupViewControllers() {
        viewControllers = [
            generateNavigationController(ofTitle: "Favorites", image: #imageLiteral(resourceName: "favorites"), rootVC: ViewController()),
            generateNavigationController(ofTitle: "Search", image: #imageLiteral(resourceName: "search"), rootVC: ViewController()),
            generateNavigationController(ofTitle: "Downloads", image: #imageLiteral(resourceName: "download"), rootVC: ViewController())
        ]
    }
    
    private func generateNavigationController(ofTitle tittle: String,image: UIImage, rootVC: UIViewController) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)
        rootVC.navigationItem.title = tittle
        navController.tabBarItem.title = tittle
        navController.tabBarItem.image = image
        return navController
    }
    
}

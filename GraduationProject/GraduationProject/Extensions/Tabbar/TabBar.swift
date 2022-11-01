//
//  TabBar.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        UITabBar.appearance().barTintColor = UIColor(named: "Background")
        tabBar.tintColor = UIColor(named: "MainColor")
        setupVCs()
    }

    func setupVCs() {
        viewControllers = [
            createNavController(for: HomePageRouter.setupModule(), title: "Home", image: UIImage(named: "Home") ?? UIImage()),
            createNavController(for: BasketPageRouter.setupModule(), title: "Card", image: UIImage(named: "Card") ?? UIImage()),
            createNavController(for: ProfilePageRouter.setupModule(), title: "Profile", image: UIImage(named: "User") ?? UIImage())
        ]
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}

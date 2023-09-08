//
//  MainTabBarController.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setTabBarAppearence()
    }
}

extension MainTabBarController {
    private func createNavController(viewController: UIViewController,
                                     title: String,
                                     image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        navController.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 6)
        navController.tabBarItem.setTitleTextAttributes(Fonts.tabItemTextAttributes, for: .normal)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        return navController
    }

    private func setTabBarAppearence() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 16

        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: positionOnX,
            y: tabBar.bounds.minY - positionOnY,
            width: width,
            height: height), cornerRadius: height / 2)

        roundLayer.path = bezierPath.cgPath

        tabBar.layer.insertSublayer(roundLayer, at: 0)

        tabBar.tintColor = .systemPink
    }

    private func setViewControllers() {
        viewControllers = [
            createNavController(
                viewController: SearchSeriesViewController(),
                title: SearchModuleHelpers.Constants.title.rawValue,
                image: Images.imageForTabItem(.search)
            )
        ]
    }
}

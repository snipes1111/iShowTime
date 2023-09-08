//
//  MainTabBarController.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    let builder = NavVCBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setTabBarAppearence()
    }
}

extension MainTabBarController {

    private func setViewControllers() {
        viewControllers = [
            builder.createSearchVc()
        ]
    }
}

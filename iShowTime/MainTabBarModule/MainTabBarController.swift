//
//  MainTabBarController.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

final class MainTabBarController: BaseTabBarController {

    private let builder: BuilderProtocol = Builder()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
    }
}

extension MainTabBarController {
    private func setViewControllers() {
        viewControllers = [
            builder.buildSearchViewController(),
            builder.buildWatchingNowViewController(),
            builder.buildFavouritesViewController()
        ]
    }
}

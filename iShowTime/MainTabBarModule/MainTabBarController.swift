//
//  MainTabBarController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 08/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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

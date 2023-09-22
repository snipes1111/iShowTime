//
//  MainTabBarController.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

class MainTabBarController: BaseTabBarController {

    var builder: BuilderProtocol!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViewControllers()
    }

}

extension MainTabBarController {
    private func setViewControllers() {
        guard let builder = builder else { return }
        viewControllers = [
            builder.buildSearchViewController(),
            builder.buildWatchingNowViewController(),
            builder.buildFinishedViewController()
        ]
    }
}

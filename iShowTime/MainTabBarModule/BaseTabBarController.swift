//
//  BaseTabBarController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 11/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    private var needUpdateBarItems: Bool = true

    override func viewWillLayoutSubviews() {
        if needUpdateBarItems {
            customizeItemTitleAndColor()
            needUpdateBarItems = false
        }
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animateSelectedItem(item)
    }
}

extension BaseTabBarController {
    private func customizeItemTitleAndColor() {
        tabBar.tintColor = Colors.tabItem
        tabBar.items?.forEach { item in
            item.titlePositionAdjustment = .init(horizontal: .zero, vertical: 8)
            item.setTitleTextAttributes(Fonts.tabItemTextAttributes, for: .normal)
        }
    }

    func animateSelectedItem(_ item: UITabBarItem) {
        let barItemView = item.value(forKey: "view") as? UIView
        barItemView?.addSpringAnimation()
    }
}

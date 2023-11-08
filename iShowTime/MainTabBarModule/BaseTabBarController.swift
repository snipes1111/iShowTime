//
//  CustomTabBarController.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLayoutSubviews() {
        customizeItemTitleAndColor()
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
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        barItemView.addSpringAnimation()
    }
}

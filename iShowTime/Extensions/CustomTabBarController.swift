//
//  CustomTabBarController.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    private let tabBarWidthInset: CGFloat = 10
    private let tabBarHeightInset: CGFloat = 14
    private let bottomInset: CGFloat = 16
    private let titleInset: CGFloat = 8

    private var tabBarWidth: CGFloat {
        tabBar.bounds.width - tabBarWidthInset * 2
    }

    private var tabBarHeight: CGFloat {
        tabBar.bounds.height + tabBarHeightInset * 2
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBar.tintColor = AppColors.tabItemColor
        addCustomLayerWithColor(AppColors.tabBarColor)
        customizeItemTitle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTabBarController {
    private func addCustomLayerWithColor(_ color: CGColor) {
        let roundLayer = CAShapeLayer()
        roundLayer.path = makeBezierPath()
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        roundLayer.fillColor = color
    }

    private func makeBezierPath() -> CGPath {
        let startPointX = tabBarWidthInset
        let startPointY = tabBar.bounds.minY - bottomInset
        let roundedRect = CGRect(x: startPointX, y: startPointY,
                                 width: tabBarWidth, height: tabBarHeight)
        return UIBezierPath(roundedRect: roundedRect,
                            cornerRadius: tabBarHeight / 2).cgPath
    }

    private func customizeItemTitle() {
        tabBar.items?.forEach { item in
            item.titlePositionAdjustment = .init(horizontal: 0, vertical: titleInset)
            item.setTitleTextAttributes(Fonts.tabItemTextAttributes, for: .normal)
        }
    }
}

//
//  UITabBar+Extensions.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

extension UITabBarController {
    func setTabBarAppearence() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let bottomInset: CGFloat = 16

        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: positionOnX,
            y: tabBar.bounds.minY - bottomInset,
            width: width,
            height: height), cornerRadius: height / 2)

        roundLayer.path = bezierPath.cgPath

        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.tintColor = .systemPink
        roundLayer.fillColor = UIColor(white: 0.9, alpha: 0.6).cgColor
    }
}

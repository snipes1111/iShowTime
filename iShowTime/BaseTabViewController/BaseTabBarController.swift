//
//  CustomTabBarController.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class BaseTabBarController: UITabBarController {

    var viewModel: BaseTabBarViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBarTranslucentAndSetItemColor()
    }

    override func viewDidLayoutSubviews() {
        prepareTabBarForLayer()
        addCustomLayerWithColor(Colors.tabBarColor)
        customizeItemTitle()
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animateSelectedItem(item)
    }
}

extension BaseTabBarController {

    private func prepareTabBarForLayer() {
        tabBar.frame.size.height = viewModel.estimatedTabBarHeight()
        tabBar.frame.origin.y = view.frame.height - viewModel.estimatedTabBarHeight()
    }

    private func makeTabBarTranslucentAndSetItemColor() {
        tabBar.backgroundColor = .clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = Colors.tabItemColor
    }

    private func addCustomLayerWithColor(_ color: CGColor) {
        let roundLayer = CAShapeLayer()
        roundLayer.path = makeBezierPath()
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        roundLayer.fillColor = color
    }

    private func makeBezierPath() -> CGPath {
        let startPointX = viewModel.tabBarWidthInset
        let startPointY = tabBar.bounds.minY - viewModel.tabBarHeightInset
        let tabBarWidth = viewModel.estimatedTabBarWidth()
        let tabBarHeight = viewModel.estimatedTabBarHeight()
        let roundedRect = CGRect(x: startPointX, y: startPointY,
                                 width: tabBarWidth, height: tabBarHeight)
        return UIBezierPath(roundedRect: roundedRect,
                            cornerRadius: tabBarHeight / 2).cgPath
    }

    private func customizeItemTitle() {
        tabBar.items?.forEach { item in
            item.titlePositionAdjustment = .init(horizontal: .zero, vertical: viewModel.tabItemTitleInset)
            item.setTitleTextAttributes(Fonts.tabItemTextAttributes, for: .normal)
        }
    }

    func animateSelectedItem(_ item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        barItemView.addSpringAnimation(0.5)
    }
}

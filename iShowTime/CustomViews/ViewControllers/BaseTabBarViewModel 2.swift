//
//  BaseTabBarViewModel.swift
//  iShowTime
//
//  Created by user on 19/09/2023.
//

import Foundation

protocol BaseTabBarViewModelProtocol {
    var tabBarWidthInset: CGFloat { get }
    var tabBarHeightInset: CGFloat { get }
    var tabItemTitleInset: CGFloat { get }

    init(tabBarHeight: CGFloat, tabBarWidth: CGFloat)

    func estimatedTabBarWidth() -> CGFloat
    func estimatedTabBarHeight() -> CGFloat
}

class BaseTabBarViewModel: BaseTabBarViewModelProtocol {

    private var tabBarHeight: CGFloat
    private var tabBarWidth: CGFloat

    var tabBarWidthInset: CGFloat {
        10
    }
    var tabBarHeightInset: CGFloat {
        14
    }
    var tabItemTitleInset: CGFloat {
        10
    }

    required init(tabBarHeight: CGFloat, tabBarWidth: CGFloat) {
        self.tabBarHeight = tabBarHeight
        self.tabBarWidth = tabBarWidth
    }

    func estimatedTabBarWidth() -> CGFloat {
        tabBarWidth - tabBarWidthInset * 2
    }

    func estimatedTabBarHeight() -> CGFloat {
        tabBarHeight + tabBarHeightInset * 2
    }
}

//
//  NavVCBuilder.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

protocol BuilderProtocol {
    func buildMainTabController(_ tabBarHeight: CGFloat, _ viewWidth: CGFloat) -> MainTabBarController
    func buildSearchViewController() -> UIViewController
    func buildWatchingNowViewController() -> UIViewController
    func buildFinishedViewController() -> UIViewController
}

class Builder: BuilderProtocol {
    func buildMainTabController(_ tabBarHeight: CGFloat, _ viewWidth: CGFloat) -> MainTabBarController {
        let viewController = MainTabBarController()
        let viewModel = BaseTabBarViewModel(tabBarHeight: tabBarHeight,
                                            tabBarWidth: viewWidth)
        viewController.viewModel = viewModel
        viewController.builder = self
        return viewController
    }

    func buildSearchViewController() -> UIViewController {
        let viewController = SearchSeriesViewController()
        let viewModel = SearchSeriesViewModel()
        let view = SearchSeriesView(viewModel: viewModel)
        viewController.searchView = view
        viewController.viewModel = viewModel
        return createNavController(
            viewController: viewController,
            title: SearchModuleConstants.title,
            image: TabBarImages.searchImage
        )
    }

    func buildWatchingNowViewController() -> UIViewController {
        let view = WatchingNowView()
        let viewModel = WatchingNowViewModel(series: SeriesModel.getSeries())
        view.viewModel = viewModel
        let viewController = WatchingNowViewController()
        viewController.watchingNowView = view
        return createNavController(
            viewController: viewController,
            title: WatchingNowConstants.title,
            image: TabBarImages.watchingNowImage
        )
    }

    func buildFinishedViewController() -> UIViewController {
        createNavController(
            viewController: FinishedViewController(),
            title: FinishedConstants.title,
            image: TabBarImages.finishedImage
        )
    }
}
extension Builder {
    private func createNavController(viewController: UIViewController,
                                     title: String,
                                     image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        return navController
    }
}

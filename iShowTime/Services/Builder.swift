//
//  NavVCBuilder.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

protocol BuilderProtocol {
    func buildMainTabController() -> MainTabBarController
    func buildSearchViewController() -> UIViewController
    func buildWatchingNowViewController() -> UIViewController
    func buildFinishedViewController() -> UIViewController
    func buildSearchSeriesDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController
    func buildWatchingNowDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController
}

final class Builder: BuilderProtocol {

    func buildMainTabController() -> MainTabBarController {
        let viewController = MainTabBarController()
        viewController.builder = self
        return viewController
    }

    func buildSearchViewController() -> UIViewController {
        let viewController = SearchSeriesViewController()
        let router = Router(viewController: viewController)
        let viewModel = SearchSeriesViewModel(router: router)
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
        let viewController = WatchingNowViewController()
        let router = Router(viewController: viewController)
        let viewModel = WatchingNowViewModel(router: router)
        let view = BaseSectionView(viewModel: viewModel)
        viewController.watchingNowView = view
        viewController.viewModel = viewModel
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

    func buildSearchSeriesDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController {
        let viewController = SearchSeriesDetailViewController(title: seriesName)
        let viewModel = SearchDetailViewModel(seriesId: seriesId)
        let view = SearchDetailView(viewModel: viewModel)
        viewController.searchDetailView = view
        viewController.viewModel = viewModel
        return viewController
    }

    func buildWatchingNowDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController {
        let viewController = WatchingNowDetailViewController(title: seriesName)
        let viewModel = WatchingNowDetailViewModel(seriesId: seriesId)
        let view = WatchingNowDetailView(viewModel: viewModel)
        viewController.watchingNowDetailView = view
        viewController.viewModel = viewModel
        return viewController
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

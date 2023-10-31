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
    func buildFavouritesViewController() -> UIViewController
    func buildSearchSeriesDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController
    func buildWatchingNowDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController
    func buildFavouritesDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController
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
        viewController.mainView = view
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
        viewController.mainView = view
        viewController.viewModel = viewModel
        return createNavController(
            viewController: viewController,
            title: WatchingNowConstants.title,
            image: TabBarImages.watchingNowImage
        )
    }

    func buildFavouritesViewController() -> UIViewController {
        let viewController = FavouritesViewController()
        let router = Router(viewController: viewController)
        let viewModel = FavouritesViewModel(router: router)
        let view = BaseSectionView(viewModel: viewModel)
        viewController.mainView = view
        viewController.viewModel = viewModel
        return createNavController(
            viewController: viewController,
            title: FavouritesConstants.title,
            image: TabBarImages.favouritesImage
        )
    }

    func buildSearchSeriesDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController {
        let viewController = SeriesDetailViewController(title: seriesName)
        let viewModel = SearchDetailViewModel(seriesId: seriesId)
        let view = SearchDetailView(viewModel: viewModel)
        viewController.mainView = view
        viewController.viewModel = viewModel
        return viewController
    }

    func buildWatchingNowDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController {
        let viewController = WatchingNowDetailViewController(title: seriesName)
        let viewModel = WatchingNowDetailViewModel(seriesId: seriesId)
        let view = WatchingNowDetailView(viewModel: viewModel)
        viewController.mainView = view
        viewController.viewModel = viewModel
        return viewController
    }

    func buildFavouritesDetailViewController(_ seriesId: Double, _ seriesName: String) -> UIViewController {
        let viewController = SeriesDetailViewController(title: seriesName)
        let viewModel = FavouritesDetailViewModel(seriesId: seriesId)
        let view = SeriesDetailView(viewModel: viewModel)
        viewController.mainView = view
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

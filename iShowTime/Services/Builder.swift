//
//  NavVCBuilder.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

protocol BuilderProtocol {
    func buildSearchViewController() -> UIViewController
    func buildWatchingNowViewController() -> UIViewController
    func buildFavouritesViewController() -> UIViewController
    func buildSearchDetailViewController(_ seriesData: SeriesData) -> UIViewController
    func buildWatchingNowDetailViewController(_ seriesData: SeriesData) -> UIViewController
    func buildFavouritesDetailViewController(_ seriesData: SeriesData) -> UIViewController
}

final class Builder: BuilderProtocol {

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
        let view = FavouritesView(viewModel: viewModel)
        viewController.mainView = view
        viewController.viewModel = viewModel
        return createNavController(
            viewController: viewController,
            title: FavouritesConstants.title,
            image: TabBarImages.favouritesImage
        )
    }

    func buildSearchDetailViewController(_ seriesData: SeriesData) -> UIViewController {
        let viewController = SeriesDetailViewController(title: seriesData.series.name)
        let viewModel = SearchDetailViewModel(seriesData: seriesData)
        let view = SearchDetailView(viewModel: viewModel)
        viewController.mainView = view
        viewController.viewModel = viewModel
        return viewController
    }

    func buildWatchingNowDetailViewController(_ seriesData: SeriesData) -> UIViewController {
        let viewController = WatchingNowDetailViewController(title: seriesData.series.name)
        let viewModel = WatchingNowDetailViewModel(seriesData: seriesData)
        let view = WatchingNowDetailView(viewModel: viewModel)
        viewController.mainView = view
        viewController.viewModel = viewModel
        return viewController
    }

    func buildFavouritesDetailViewController(_ seriesData: SeriesData) -> UIViewController {
        let viewController = SeriesDetailViewController(title: seriesData.series.name)
        let viewModel = FavouritesDetailViewModel(seriesData: seriesData)
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

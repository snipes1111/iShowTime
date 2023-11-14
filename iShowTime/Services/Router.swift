//
//  Router.swift
//  iShowTime
//
//  Created by user on 10/10/2023.
//

import UIKit

protocol RouterProtocol {
    init(viewController: UIViewController)
    func showDetailSeriesViewController(seriesData: SeriesData)
}

final class Router: RouterProtocol {
    private let viewController: UIViewController
    private let builder = Builder()

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func showDetailSeriesViewController(seriesData: SeriesData) {
        if viewController is SearchSeriesViewController {
            let detailVc = builder.buildSearchDetailViewController(seriesData)
            viewController.present(detailVc, animated: true)
        } else if viewController is WatchingNowViewController {
            let detailVc = builder.buildWatchingNowDetailViewController(seriesData)
            viewController.navigationController?.pushViewController(detailVc, animated: true)
        } else {
            let detailVc = builder.buildFavouritesDetailViewController(seriesData)
            viewController.navigationController?.pushViewController(detailVc, animated: true)
        }
    }
}

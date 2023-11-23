//
//  Router.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 10/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    init(viewController: UIViewController)
    func showDetailViewController(seriesData: SeriesData)
    func pushDetailViewController(seriesData: SeriesData)
    func pushProgressViewController(seriesData: SeriesData)
}

final class Router: RouterProtocol {
    private let viewController: UIViewController
    private let builder = Builder()

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func showDetailViewController(seriesData: SeriesData) {
        let detailVc = builder.buildSearchDetailViewController(seriesData)
        viewController.present(detailVc, animated: true)
    }

    func pushProgressViewController(seriesData: SeriesData) {
        let detailVc = builder.buildWatchingNowDetailViewController(seriesData)
        viewController.navigationController?.pushViewController(detailVc, animated: true)
    }

    func pushDetailViewController(seriesData: SeriesData) {
        let detailVc = builder.buildFavouritesDetailViewController(seriesData)
        viewController.navigationController?.pushViewController(detailVc, animated: true)
    }

}

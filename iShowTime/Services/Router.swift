//
//  Router.swift
//  iShowTime
//
//  Created by user on 10/10/2023.
//

import UIKit

protocol RouterProtocol {
    init(viewController: UIViewController)
    func showDetailSeriesViewController(_ seriesID: Double, _ seriesName: String)
}

final class Router: RouterProtocol {
    private var viewController: UIViewController
    private var builder = Builder()

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func showDetailSeriesViewController(_ seriesID: Double, _ seriesName: String) {
        if viewController is SearchSeriesViewController {
            let detailVc = builder.buildSearchSeriesDetailViewController(seriesID, seriesName)
            viewController.present(detailVc, animated: true)
        } else if viewController is WatchingNowViewController {
            let detailVc = builder.buildWatchingNowDetailViewController(seriesID, seriesName)
            viewController.navigationController?.pushViewController(detailVc, animated: true)
        } else {
            let detailVc = builder.buildSearchSeriesDetailViewController(seriesID, seriesName)
            viewController.navigationController?.pushViewController(detailVc, animated: true)
        }
    }
}

//
//  Router.swift
//  iShowTime
//
//  Created by user on 10/10/2023.
//

import UIKit

protocol RouterProtocol {
    init(viewController: UIViewController)
    func showDetailSeriesViewController(seriesID: String)
}

class Router: RouterProtocol {
    private var viewController: UIViewController

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func showDetailSeriesViewController(seriesID: String) {
        let newViewController = UIViewController()
        newViewController.title = seriesID
        newViewController.view.backgroundColor = .white
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }
}

//
//  WatchingNowViewController.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class WatchingNowViewController: UIViewController {

    var watchingNowView: WatchingNowView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        watchingNowView.frame = view.frame
        view = watchingNowView

    }
}

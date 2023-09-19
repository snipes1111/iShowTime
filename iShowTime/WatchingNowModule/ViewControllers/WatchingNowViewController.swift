//
//  WatchingNowViewController.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class WatchingNowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let watchingNowView = WatchingNowView()
        let series = SeriesModel.getSeries()
        watchingNowView.viewModel = WatchingNowViewModel(series: series)
        watchingNowView.frame = view.frame
        view = watchingNowView
    }
}

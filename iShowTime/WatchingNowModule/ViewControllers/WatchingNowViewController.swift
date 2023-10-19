//
//  WatchingNowViewController.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class WatchingNowViewController: UIViewController {

    var watchingNowView: WatchingNowView!
    var viewModel: WatchingNowViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        createWatchingNowView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchSeries()
    }

    func createWatchingNowView() {
        watchingNowView.frame = view.frame
        view.addSubview(watchingNowView)
    }

}

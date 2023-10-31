//
//  WatchingNowDetailViewController.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailViewController: UIViewController {

    private var keyboardManager: KeyboardManager!
    var watchingNowDetailView: WatchingNowDetailView!
    var viewModel: SeriesDetailRepresentableProtocol!

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = false
        createSearchDetailView()
        viewModel.fetchSeriesDetails()
        createKeyboardManager()
    }

    convenience init(title: String) {
        self.init(nibName: nil, bundle: nil)
        self.title = title
    }

    func createSearchDetailView() {
        view.addSubview(watchingNowDetailView)
        watchingNowDetailView.fillSuperView(view)
    }

    func createKeyboardManager() {
        keyboardManager = KeyboardManager(watchingNowDetailView)
        keyboardManager.addNotifications()
    }
}

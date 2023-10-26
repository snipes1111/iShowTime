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
    var viewModel: SeriesDetailViewModelProtocol!

    private var color: UIColor?
    private var image: UIImage?
    private var imageTwo: UIImage?

    override func viewDidLoad() {
        createSearchDetailView()
        viewModel.fetchSeriesDetails()
        createKeyboardManager()
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    convenience init(title: String) {
        self.init(nibName: nil, bundle: nil)
        self.title = title
    }

    func createSearchDetailView() {
        watchingNowDetailView.frame = view.frame
        view.addSubview(watchingNowDetailView)
    }

    func createKeyboardManager() {
        keyboardManager = KeyboardManager(watchingNowDetailView)
        keyboardManager.addNotifications()
    }
}

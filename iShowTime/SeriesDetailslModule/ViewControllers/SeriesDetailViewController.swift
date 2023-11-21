//
//  SeriesDetailViewConntroller.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import UIKit

class SeriesDetailViewController: UIViewController {

    var mainView: SeriesDetailView!
    var viewModel: SeriesDetailViewModelProtocol!

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        viewModel.fetchSeriesDetails()
        // check for modal presentation to adjust the insets
        if navigationController == nil {
            mainView.tableView.contentInset.top = 60
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }

    convenience init(title: String?) {
        self.init(nibName: nil, bundle: nil)
        self.title = title
    }
}

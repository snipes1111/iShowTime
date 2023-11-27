//
//  SeriesDetailViewController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 31/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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
    //sent notification to reload data whether the model did change
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name("ReloadDataNotification"), object: nil)
    }

    convenience init(title: String?) {
        self.init(nibName: nil, bundle: nil)
        self.title = title
    }
}

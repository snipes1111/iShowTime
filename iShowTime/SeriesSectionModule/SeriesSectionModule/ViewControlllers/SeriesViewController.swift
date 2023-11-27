//
//  SeriesViewController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 11/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesViewController: BaseSectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchSeries()
        //add notification to catch series data did change
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name("ReloadDataNotification"), object: nil)
    }

    @objc func reloadData() {
        viewModel.fetchSeries()
    }

}

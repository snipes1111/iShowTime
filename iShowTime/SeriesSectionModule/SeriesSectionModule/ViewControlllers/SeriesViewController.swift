//
//  SeriesViewController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 11/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesViewController: BaseSectionViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchSeries()
    }
}

//
//  WatchingNowViewController.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class WatchingNowViewController: BaseSectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchSeries(nil)
    }

}

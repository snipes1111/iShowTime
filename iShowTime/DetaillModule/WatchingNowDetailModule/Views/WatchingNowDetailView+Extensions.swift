//
//  WatchingNowDetailView+Extensions.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

extension WatchingNowDetailView {

    func setupUI() {
        createTableView()
        createLoadingView()
        createSpinner()
    }

    func createLoadingView() {
        let view = UIView()
        view.backgroundColor = .black
        addSubview(view)
        view.fillSuperView(self)
        loadingView = view
    }

    func createSpinner() {
        let spinner = SpinnerView()
        addSubview(spinner)
        spinner.fillSuperView(self)
        self.spinner = spinner
    }
}

//
//  SeriesDetailView + Extensions.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

extension SeriesDetailView {

    func setupUI() {
        setupTableView()
        setupLoadingView()
    }

    func setupLoadingView() {
        addSubview(loadingView)
        loadingView.fillSuperView(self)
    }

    func setupTableView() {
        tableView.contentInset.top = tableViewTopInset
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType, forCellReuseIdentifier: cellIdentifier)
        addTableViewToView()
    }

    func addTableViewToView() {
        addSubview(tableView)
        tableView.fillSuperView(self)
    }
}

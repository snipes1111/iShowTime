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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(viewModel.cellType.self, forCellReuseIdentifier: DetailCell.identifier)
        addSubview(tableView)
        tableView.fillSuperView(self)
    }
}

extension SeriesDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension SeriesDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell
        else { return UITableViewCell() }
        cell.viewModel = viewModel.returnDetailCellViewModel()
        return cell
    }
}


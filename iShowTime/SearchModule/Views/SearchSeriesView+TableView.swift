//
//  SearchSeriesViewController+TableView.swift
//  iShowTime
//
//  Created by user on 21/09/2023.
//

import UIKit

extension SearchSeriesView {
    func createTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchSeriesCell.self, forCellReuseIdentifier: SearchModuleConstants.seriesCellIdentifier)
        addTableView()
    }

    private func addTableView() {
        addSubview(tableView)
        setTableViewConstraints()
    }

    private func setTableViewConstraints() {
        tableView.fillSuperView(self)
    }
}

extension SearchSeriesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchModuleConstants.seriesCellIdentifier,
                                                       for: indexPath) as? SearchSeriesCell
        else { return UITableViewCell() }
        viewModel.configureCell(cell, indexPath)
        return cell
    }
}

extension SearchSeriesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(viewModel.heightForRow)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showDetails(at: indexPath)
    }
}

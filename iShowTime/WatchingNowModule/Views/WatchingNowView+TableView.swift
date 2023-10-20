//
//  WatchingNowView+Extensions.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

extension WatchingNowView: UITableViewDataSource {

    func addTableView() {
        addSubview(tableView)
        tableView.fillSuperView(self)
    }

    func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WatchingNowSeriesCell.self,
                           forCellReuseIdentifier: WatchingNowConstants.seriesCellIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WatchingNowConstants.seriesCellIdentifier,
                                                       for: indexPath) as? WatchingNowSeriesCell
        else { return UITableViewCell() }
        viewModel.configureCell(cell, indexPath)
        return cell
    }
}

extension WatchingNowView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(viewModel.heightForRow)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showDetails(at: indexPath)
    }
}

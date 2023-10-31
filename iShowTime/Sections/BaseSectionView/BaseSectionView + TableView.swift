//
//  BaseSectionView + TableView.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import UIKit

extension BaseSectionView {

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SeriesCell.self, forCellReuseIdentifier: String(describing: SeriesCell.self))
        addTableViewToView()
    }

    func addTableViewToView() {
        addSubview(tableView)
        tableView.fillSuperView(self)
    }

}

extension BaseSectionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SeriesCell.self),
                                                       for: indexPath) as? SeriesCell
        else { return UITableViewCell() }
        cell.viewModel = viewModel.returnCellViewModel(at: indexPath)
        return cell
    }
}

extension BaseSectionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(viewModel.heightForRow)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showDetails(at: indexPath)
    }
}

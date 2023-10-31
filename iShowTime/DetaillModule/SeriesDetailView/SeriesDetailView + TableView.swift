//
//  SeriesDetailView + TableView.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

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
        return configuredDetailCell(indexPath, cellType)
    }
}

extension SeriesDetailView {
    private func configuredDetailCell(_ indexPath: IndexPath, _ cellType: UITableViewCell.Type) -> UITableViewCell {
        guard let cell = returnCellOfType(cellType, for: indexPath) as? DetailCell
        else { return UITableViewCell() }
        cell.viewModel = viewModel.returnDetailCellViewModel()
        return cell
    }

    private func returnCellOfType(_ cellType: UITableViewCell.Type, for indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        switch cellType {
        case is SeriesDescriptionCell.Type: return (cell as? SeriesDescriptionCell)
        case is WatchingNowDetailCell.Type: return (cell as? WatchingNowDetailCell)
        default: return UITableViewCell()
        }
    }
}

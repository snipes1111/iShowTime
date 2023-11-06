//
//  FavouritesView.swift
//  iShowTime
//
//  Created by user on 01/11/2023.
//

import UIKit

final class FavouritesView: BaseSectionView {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                     indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [action])
    }

    private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .destructive,
                                  title: "Delete") { [unowned self] _, _, isDone in
            guard let viewModel = viewModel as? EditableCellViewModelProtocol else { return }
            viewModel.deleteRow(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            isDone(true)
        }
    }
}

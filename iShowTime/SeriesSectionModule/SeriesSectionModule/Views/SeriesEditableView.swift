//
//  SeriesEditableView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 01/11/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesEditableView: BaseSectionView {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                     indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [action])
    }

    private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .destructive,
                                  title: "Delete") { _, _, isDone in
            guard let viewModel = self.viewModel as? EditableCellViewModelProtocol else { return }
            viewModel.deleteRow(at: indexPath)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            isDone(true)
        }
    }
}

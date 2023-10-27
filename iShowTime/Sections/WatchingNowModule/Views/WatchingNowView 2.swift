//
//  WatchingNowView.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class WatchingNowView: UIView {

    var tableView: UITableView!
    var viewModel: WatchingNowViewModelProtocol

    init(viewModel: WatchingNowViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupTableView()
        addTableView()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func subscribeToViewModel() {
        viewModel.viewModelDidChange = { _ in
            DispatchQueue.main.async { [unowned self] in
                tableView.reloadData()
            }
        }
    }
}

//
//  SearchDetailView.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

final class SearchDetailView: UIView {

    var viewModel: SearchDetailViewModelProtocol
    var tableView: UITableView!
    var blurBackgroundView: UIView!
    var backDropImageView: SeriesImageView!

    init(viewModel: SearchDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        createTableView()
//        createBackDropImageView()
//        createBlurBackgroundView()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func subscribeToViewModel() {
        viewModel.viewModelDidChange = { _ in
            DispatchQueue.main.async { [unowned self] in
                tableView.reloadData()
                updateBackDropImageView()
            }
        }
    }
}

//
//  SeriesDetailView.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

class SeriesDetailView: UIView {

    private(set) var viewModel: (SeriesDetailViewModelProtocol & SeriesDetailRepresentableProtocol)
    private(set) var tableView = DetailTableView()
    private(set) var backDropImageView = SeriesImageView()
    private(set) var loadingView = LoadingView()

    var cellIdentifier: String {
        "cell"
    }
    var cellType: UITableViewCell.Type {
        UITableViewCell.self
    }
    var tableViewTopInset: CGFloat {
        0
    }

    init(viewModel: (SeriesDetailViewModelProtocol & SeriesDetailRepresentableProtocol)) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        assignBackDropImageView()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func assignBackDropImageView() {
        backDropImageView = tableView.backDropImageView
    }

    func updateBackDropImageView() {
        backDropImageView.getImage(viewModel.backDropImageUrl)
    }

    private func subscribeToViewModel() {
        viewModel.viewModelDidChange = { [unowned self] _ in
            reloadInterface()
        }
    }

    private func reloadInterface() {
        let dispatchGroup = DispatchGroup()
        DispatchQueue.main.async(group: dispatchGroup) { [unowned self] in
            updateBackDropImageView()
            tableView.reloadData()
            loadingView.hideWithAnimation()
        }
    }
}

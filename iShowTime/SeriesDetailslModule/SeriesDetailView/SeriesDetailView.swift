//
//  SeriesDetailView.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

class SeriesDetailView: UIView {

    private(set) var viewModel: (SeriesDetailViewModelProtocol & SeriesDetailRepresentableProtocol)
    private(set) var tableView = TableViewWithBlurBackground()
    private(set) var loadingView = LoadingView()

    init(viewModel: (SeriesDetailViewModelProtocol & SeriesDetailRepresentableProtocol)) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateBackDropImageView() {
        tableView.backDropImageView.getImage(viewModel.backDropImageUrl) { [weak self] isDone in
            guard let self = self else { return }
            if isDone { self.loadingView.hideWithAnimation() }
        }
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
        }
    }
}

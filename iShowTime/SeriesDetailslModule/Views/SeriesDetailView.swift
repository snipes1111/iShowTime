//
//  SeriesDetailView.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

final class SeriesDetailView: UIView {

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

    private func subscribeToViewModel() {
            viewModel.viewModelDidChange = { [weak self]  _ in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.tableView.beginUpdates()
                    self.tableView.endUpdates()
                    self.setupBackground()
                }
            }
    }

    private func setupBackground() {
        if loadingView.isHidden { return }
        tableView.backDropImageView.getImage(viewModel.backDropImageUrl) { [weak self] _ in
            guard let self = self else { return }
            self.loadingView.hideWithAnimation()
        }
    }
}

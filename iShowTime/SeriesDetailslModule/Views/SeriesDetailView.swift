//
//  SeriesDetailView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 26/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesDetailView: UIView {

    private(set) var viewModel: SeriesDetailViewModelProtocol
    private(set) var tableView = TableViewWithBlurBackground()
    private(set) var loadingView = LoadingView()

    init(viewModel: SeriesDetailViewModelProtocol) {
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
        if let imageData = viewModel.backDropImageData {
            tableView.backDropImageView.image = UIImage(data: imageData)
            loadingView.hideWithAnimation()
        } 
    }
}

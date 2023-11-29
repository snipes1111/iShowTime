//
//  DetailCell.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 23/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

class DetailCell: BaseDetailCell {

    var viewModel: DetailCellViewModelProtocol? {
        didSet {
            updateViews()
        }
    }

    override func setupSubviews() {
        super.setupSubviews()
        seriesButton.addAction(UIAction(buttonPressed), for: .touchUpInside)
    }

    func updateViews() {
        nameLabel.text = viewModel?.seriesName
        updateWatchingNowButtonTitle()
        if let data = viewModel?.imageData {
            posterImageView.image = UIImage(data: data)
        }
    }
}

extension DetailCell {

    @objc private func buttonPressed() {
        viewModel?.watchingNowButtonPressed()
        updateWatchingNowButtonTitle()
    }

    private func updateWatchingNowButtonTitle() {
        guard let isSaved = viewModel?.isBeingWatched,
              let button = seriesButton as? SeriesButton
        else { return }
        !isSaved ? button.switchToActiveState() : button.switchToTappedBeforeState()
    }
}

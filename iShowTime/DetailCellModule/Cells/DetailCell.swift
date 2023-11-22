//
//  SeriesDetailCell.swift
//  iShowTime
//
//  Created by user on 23/10/2023.
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
        posterImageView.getImage(viewModel?.imageUrl)
        nameLabel.text = viewModel?.seriesName
        updateWatchingNowButtonTitle()
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
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

    override func setupSubViews() {
        super.setupSubViews()
        watchingNowButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    func updateViews() {
        posterImageView.getImage(viewModel?.imageUrl)
        nameLabel.text = viewModel?.seriesName
        updateWatchingNowButtonTitle()
    }

    deinit {
        viewModel?.updateSeriesList()
    }
}

extension DetailCell {

    @objc private func buttonPressed() {
        viewModel?.watchingNowButtonPressed()
        updateWatchingNowButtonTitle()
    }

    private func updateWatchingNowButtonTitle() {
        guard let isSaved = viewModel?.isBeingWatched,
              let button = watchingNowButton as? SeriesButton
        else { return }
        if !isSaved {
            button.switchToActiveState()
        } else {
            button.switchToTappedBeforeState()
        }
    }
}

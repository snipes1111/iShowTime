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
}

extension DetailCell {

    @objc private func buttonPressed() {
        viewModel?.watchingNowButtonPressed()
        updateWatchingNowButtonTitle()
    }

    private func updateWatchingNowButtonTitle() {
        guard let isSaved = viewModel?.seriesIsSaved,
              let button = watchingNowButton as? WatchingNowButton
        else { return }
        if !isSaved {
            button.addToWatchState()
        } else {
            button.removeFromWatchState()
        }
    }
}

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

    func updateViews() {
        posterImageView.getImage(viewModel?.imageUrl)
        nameLabel.text = viewModel?.seriesName
        watchingNowButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        updateWatchingNowButtonTitle()
    }
}

extension DetailCell {

    @objc private func buttonPressed() {
        viewModel?.watchingNowButtonPressed()
        updateWatchingNowButtonTitle()
    }

    private func updateWatchingNowButtonTitle() {
        guard let isSaved = viewModel?.seriesIsSaved else { return }
        if !isSaved {
            watchingNowButton.setTitle(SearchModuleConstants.addToWatchingNow, for: .normal)
            watchingNowButton.setTitleColor(.black, for: .normal)
        } else {
            watchingNowButton.setTitle(SearchModuleConstants.removeFromWatchingNow, for: .normal)
            watchingNowButton.setTitleColor(.darkGray, for: .normal)
        }
    }
}

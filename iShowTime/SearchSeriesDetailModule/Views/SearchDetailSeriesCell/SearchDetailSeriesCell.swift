//
//  SearchDetailSeriesCell.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

class SearchDetailSeriesCell: BaseDetailTableViewCell {
    var viewModel: SearchSeriesDetailCellViewModelProtocol? {
        didSet {
            posterImageView.getImage(viewModel?.imageUrl)
            nameLabel.text = viewModel?.seriesName
            updateRating()
            genreLabel.text = viewModel?.genreAndYear
            countrySeasonsAndYearLabel.text = viewModel?.countrySeasonsAndYear
            updateOverview()
            setupWatchingNowButton()
            updateWatchingNowButtonTitle()
        }
    }

    @objc private func buttonPressed() {
        viewModel?.watchingNowButtonPressed()
        updateWatchingNowButtonTitle()
    }
}

extension SearchDetailSeriesCell {
    private func updateRating() {
        ratingIsLabel.text = viewModel?.ratingIs
        ratingScoreLabel.text = viewModel?.scoreRating
        ratingScoreLabel.textColor = getColor()
    }

    private func updateOverview() {
        guard let viewModel = viewModel else { return }
        let text = viewModel.attributedOverviewText + viewModel.overview
        overviewLabel.text = text
        overviewLabel.addTextAttributes(for: viewModel.attributedOverviewText)
    }

    private func getColor() -> UIColor {
        guard let color = viewModel?.scoreRatingColor else { return .black }
        switch color {
        case .black: return .black
        case .green: return .systemGreen
        case .red: return .systemRed
        case .yellow: return .systemOrange
        }
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

    private func setupWatchingNowButton() {
        watchingNowButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}

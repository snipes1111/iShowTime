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
            seriesNameLabel.text = viewModel?.seriesName
            seriesRatingIsLabel.text = viewModel?.seriesRatingIs
            seriesRatingScoreLabel.text = viewModel?.seriesScoreRating
            seriesRatingScoreLabel.textColor = getColor()
            seriesGenreLabel.text = viewModel?.genreAndYear
            seriesCountryAndSeasonsCountAndYearLabel.text = viewModel?.countryAndSeasonsCount
            seriesOverviewLabel.text = viewModel?.overview
            seriesOverviewLabel.addTextAttributes(for: viewModel?.attributedOverviewText)
            watchingNowButton.setTitle(viewModel?.watchingNowButtonTitle, for: .normal)
        }
    }

    func getColor() -> UIColor {
        guard let color = viewModel?.scoreRatingColor else { return .black }
        switch color {
        case .black: return .black
        case .green: return .systemGreen
        case .red: return .systemRed
        case .yellow: return .systemOrange
        }
    }
}

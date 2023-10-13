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
            seriesRatingLabel.text = viewModel?.seriesRating
            seriesGenreLabel.text = viewModel?.genreAndYear
            seriesCountryAndSeasonsCountAndYearLabel.text = viewModel?.countryAndSeasonsCount
            seriesOverviewLabel.text = viewModel?.overview
        }
    }
}

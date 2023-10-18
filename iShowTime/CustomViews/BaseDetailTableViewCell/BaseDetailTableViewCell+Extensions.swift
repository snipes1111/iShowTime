//
//  BaseDetailTableViewCell+Extensionns.swift
//  iShowTime
//
//  Created by user on 18/10/2023.
//

import UIKit

extension BaseDetailTableViewCell {
    func createPosterImageView() {
        let imageView = SeriesImageView()
        imageView.addShadow()
        posterImageView = imageView
    }

    func createSeriesNameLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.seriesNameLabel)
        label.textAlignment = .center
        nameLabel = label
    }

    func createSeriesRatingIsLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.seriesRatingIsLabel,
                            numberOfLines: 1)
        ratingIsLabel = label
    }

    func createSeriesRatingScoreLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.seriesRatingScoreLabel,
                            numberOfLines: 1)
        ratingScoreLabel = label
    }

    func createSeriesGenreLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.genreLabel)
        label.textAlignment = .center
        genreLabel = label
    }

    func createSeriesCountryAndSeasonsCountAndYearLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.countrySeasonsAndYearLabel)
        countrySeasonsAndYearLabel = label
    }

    func createSeriesOverviewLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.overviewLabel)
        overviewLabel = label
    }

    func createWatchingNowButton() {
        let button = WatchingNowButton()
        watchingNowButton = button
    }
}

//
//  BaseSearchDetailCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

class BaseSearchDetailCell: BaseDetailCell {
    var ratingIsLabel: UILabel!
    var ratingScoreLabel: UILabel!
    var genreLabel: UILabel!
    var countrySeasonsAndYearLabel: UILabel!
    var overviewLabel: UILabel!
    var watchingNowButton: UIButton!

    override func setupView() {
        super.setupView()
        let ratingHStack = UIStackView(arrangedSubviews: [ratingIsLabel, ratingScoreLabel])
        vStack.addArrangedSubviews([ratingHStack,
                                    genreLabel,
                                    countrySeasonsAndYearLabel,
                                    overviewLabel,
                                    watchingNowButton])
        vStack.setCustomSpacing(32, after: overviewLabel)
    }

    override func makeConstraints(_ view: UIView) {
        super.makeConstraints(view)
        watchingNowButton.setSize(50, 250)
    }

    override func setupSubViews() {
        super.setupSubViews()
        createSeriesRatingIsLabel()
        createSeriesRatingScoreLabel()
        createSeriesGenreLabel()
        createSeriesCountryAndSeasonsCountAndYearLabel()
        createSeriesOverviewLabel()
        createWatchingNowButton()
    }
}

extension BaseSearchDetailCell {
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

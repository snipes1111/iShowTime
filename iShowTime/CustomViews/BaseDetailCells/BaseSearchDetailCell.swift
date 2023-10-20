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

    override func setupSubViews() {
        super.setupSubViews()
        setupUI()
    }
}

extension BaseSearchDetailCell {
    func setupUI() {
        ratingIsLabel = UILabel(font: Fonts.SearchDetailModule.seriesRatingIsLabel, numberOfLines: 1)
        ratingScoreLabel = UILabel(font: Fonts.SearchDetailModule.seriesRatingScoreLabel, numberOfLines: 1)
        genreLabel = UILabel(font: Fonts.SearchDetailModule.genreLabel)
        genreLabel.textAlignment = .center
        countrySeasonsAndYearLabel = UILabel(font: Fonts.SearchDetailModule.countrySeasonsAndYearLabel)
        overviewLabel = UILabel(font: Fonts.SearchDetailModule.overviewLabel)
        watchingNowButton = WatchingNowButton()
    }
}

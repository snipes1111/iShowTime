//
//  BaseSearchDetailCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

class BaseSeriesDescriptionCell: DetailCell {
    var ratingIsLabel: UILabel!
    var ratingScoreLabel: UILabel!
    var genreLabel: UILabel!
    var countrySeasonsAndYearLabel: UILabel!
    var overviewLabel: UILabel!
    var showMoreButton: UIButton!
    var showMoreButtonStack: UIStackView!
    var heartButton: HeartButton!
    private var ratingHStack: UIStackView!
    private var overviewStack: UIStackView!

    override func setupSubviews() {
        super.setupSubviews()
        ratingIsLabel = UILabel(font: Fonts.DetailCell.seriesRating, numberOfLines: 1)
        ratingScoreLabel = UILabel(font: Fonts.DetailCell.seriesRatingScore, numberOfLines: 1)
        genreLabel = UILabel(font: Fonts.DetailCell.seriesInfo)
        genreLabel.textAlignment = .center
        countrySeasonsAndYearLabel = UILabel(font: Fonts.DetailCell.seriesInfo)
        overviewLabel = UILabel(font: Fonts.DetailCell.seriesInfo, numberOfLines: 5)
        showMoreButton = ShowMoreButton()
        showMoreButtonStack = HorizontalStackView(arrangedSubviews: [showMoreButton, UIView()])
        heartButton = HeartButton()
        ratingHStack = HorizontalStackView(arrangedSubviews: [ratingIsLabel, ratingScoreLabel])
        overviewStack = VerticalStackView(arrangedSubviews: [overviewLabel, showMoreButtonStack])
        vStack.addArrangedSubviews([ratingHStack,
                                    genreLabel,
                                    countrySeasonsAndYearLabel,
                                    overviewStack,
                                    seriesButton])
        addSubview(heartButton)
    }

    override func setupConstraints() {
        super.setupConstraints()
        vStack.setCustomSpacing(24, after: overviewStack)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.topAnchor.constraint(equalTo: ratingHStack.topAnchor, constant: -6).isActive = true
        heartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
    }
}

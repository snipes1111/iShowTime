//
//  BaseSearchDetailCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

class BaseSearchDetailCell: DetailCell {
    var ratingIsLabel: UILabel!
    var ratingScoreLabel: UILabel!
    var genreLabel: UILabel!
    var countrySeasonsAndYearLabel: UILabel!
    var overviewLabel: UILabel!
    var heartButton: HeartButton!

    override func setupView() {
        super.setupView()
        let ratingHStack = UIStackView(arrangedSubviews: [ratingIsLabel, ratingScoreLabel])
        ratingHStack.spacing = 8
        vStack.addArrangedSubviews([ratingHStack,
                                    genreLabel,
                                    countrySeasonsAndYearLabel,
                                    overviewLabel,
                                    watchingNowButton])
        vStack.setCustomSpacing(32, after: overviewLabel)
        makeHeartButtonConstraints(equalTo: ratingHStack)
    }

    override func setupSubViews() {
        super.setupSubViews()
        ratingIsLabel = UILabel(font: Fonts.SearchDetailModule.seriesRatingIsLabel, numberOfLines: 1)
        ratingScoreLabel = UILabel(font: Fonts.SearchDetailModule.seriesRatingScoreLabel, numberOfLines: 1)
        genreLabel = UILabel(font: Fonts.SearchDetailModule.genreLabel)
        genreLabel.textAlignment = .center
        countrySeasonsAndYearLabel = UILabel(font: Fonts.SearchDetailModule.countrySeasonsAndYearLabel)
        overviewLabel = UILabel(font: Fonts.SearchDetailModule.overviewLabel)
        heartButton = HeartButton()
    }

    private func makeHeartButtonConstraints(equalTo view: UIView) {
        addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: -6).isActive = true
        heartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
    }
}

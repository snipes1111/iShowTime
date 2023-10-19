//
//  BaseDetailTableViewCell.swift
//  iShowTime
//
//  Created by user on 12/10/2023.
//

import UIKit

class BaseDetailTableViewCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var nameLabel: UILabel!
    var ratingIsLabel: UILabel!
    var ratingScoreLabel: UILabel!
    var genreLabel: UILabel!
    var countrySeasonsAndYearLabel: UILabel!
    var overviewLabel: UILabel!
    var watchingNowButton: UIButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        setupSubViews()
        let ratingHStack = UIStackView(arrangedSubviews: [ratingIsLabel, ratingScoreLabel])
        let vStack = VerticalStackView(spacing: 8, arrangedSubviews: [posterImageView,
                                                                      nameLabel,
                                                                      ratingHStack,
                                                                      genreLabel,
                                                                      countrySeasonsAndYearLabel,
                                                                      overviewLabel,
                                                                      watchingNowButton])
        vStack.setCustomSpacing(32, after: overviewLabel)
        vStack.alignment = .center
        contentView.addSubview(vStack)
        makeConstraints(vStack)
    }

    func makeConstraints(_ view: UIView) {
        posterImageView.setSize(300, 200)
        nameLabel.setHeight(75)
        watchingNowButton.setSize(50, 250)
        view.fillSuperView(contentView, padding: 18)
    }

    func setupSubViews() {
        createPosterImageView()
        createSeriesNameLabel()
        createSeriesRatingIsLabel()
        createSeriesRatingScoreLabel()
        createSeriesGenreLabel()
        createSeriesCountryAndSeasonsCountAndYearLabel()
        createSeriesOverviewLabel()
        createWatchingNowButton()
    }

}

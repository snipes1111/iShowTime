//
//  BaseDetailTableViewCell.swift
//  iShowTime
//
//  Created by user on 12/10/2023.
//

import UIKit

class BaseDetailTableViewCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var seriesNameLabel: UILabel!
    var seriesRatingIsLabel: UILabel!
    var seriesRatingScoreLabel: UILabel!
    var seriesGenreLabel: UILabel!
    var seriesCountryAndSeasonsCountAndYearLabel: UILabel!
    var seriesOverviewLabel: UILabel!
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
        let ratingHStack = UIStackView(arrangedSubviews: [seriesRatingIsLabel, seriesRatingScoreLabel])
        let vStack = VerticalStackView(spacing: 8, arrangedSubviews: [posterImageView,
                                                                      seriesNameLabel,
                                                                      ratingHStack,
                                                                      seriesGenreLabel,
                                                                      seriesCountryAndSeasonsCountAndYearLabel,
                                                                      seriesOverviewLabel,
                                                                      watchingNowButton])
        vStack.setCustomSpacing(32, after: seriesOverviewLabel)
        vStack.alignment = .center
        contentView.addSubview(vStack)
        makeConstraints(vStack)
    }

    func makeConstraints(_ view: UIView) {
        posterImageView.setSize(300, 200)
        seriesNameLabel.setHeight(75)
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

    func createPosterImageView() {
        let imageView = SeriesImageView()
        imageView.addShadow()
        posterImageView = imageView
    }

    func createSeriesNameLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.seriesNameLabel)
        label.textAlignment = .center
        seriesNameLabel = label
    }

    func createSeriesRatingIsLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.seriesRatingIsLabel,
                            numberOfLines: 1)
        seriesRatingIsLabel = label
    }

    func createSeriesRatingScoreLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.seriesRatingScoreLabel,
                            numberOfLines: 1)
        seriesRatingScoreLabel = label
    }

    func createSeriesGenreLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.genreLabel)
        label.textAlignment = .center
        seriesGenreLabel = label
    }

    func createSeriesCountryAndSeasonsCountAndYearLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.countrySeasonsAndYearLabel)
        seriesCountryAndSeasonsCountAndYearLabel = label
    }

    func createSeriesOverviewLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.overviewLabel)
        seriesOverviewLabel = label
    }

    func createWatchingNowButton() {
        let button = WatchingNowButton()
        watchingNowButton = button
    }
}

extension UIButton {

    func pulsate() {

        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0

        layer.add(pulse, forKey: "pulse")
    }
}

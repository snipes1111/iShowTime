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
        let hStack = UIStackView(arrangedSubviews: [seriesRatingIsLabel, seriesRatingScoreLabel])
        let vStack = VerticalStackView(spacing: 8, arrangedSubviews: [posterImageView,
                                                                      seriesNameLabel,
                                                                      hStack,
                                                                      seriesGenreLabel,
                                                                      seriesCountryAndSeasonsCountAndYearLabel,
                                                                      seriesOverviewLabel,
                                                                      UIView()])
        vStack.alignment = .center
        contentView.addSubview(vStack)
        makeConstraints(vStack)
    }

    func makeConstraints(_ view: UIView) {
        posterImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        seriesNameLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        view.fillSuperView(contentView, padding: 32)
    }

    func setupSubViews() {
        createPosterImageView()
        createSeriesNameLabel()
        createSeriesRatingIsLabel()
        createSeriesRatingScoreLabel()
        createSeriesGenreLabel()
        createSeriesCountryAndSeasonsCountAndYearLabel()
        createSeriesOverviewLabel()
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
}

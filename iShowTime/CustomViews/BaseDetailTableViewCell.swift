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
    var seriesRatingLabel: UILabel!
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
        let vStack = VerticalStackView(spacing: 8, arrangedSubviews: [posterImageView,
                                                                      seriesNameLabel,
                                                                      seriesRatingLabel,
                                                                      seriesGenreLabel,
                                                                      seriesCountryAndSeasonsCountAndYearLabel,
                                                                      seriesOverviewLabel,
                                                                      UIView()])
        vStack.distribution = .fill
        vStack.alignment = .center
        contentView.addSubview(vStack)
        makeConstraints(vStack)
    }

    func makeConstraints(_ view: UIView) {
        posterImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        seriesNameLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        view.fillSuperView(contentView, padding: 32)
    }

    func setupSubViews() {
        createPosterImageView()
        createSeriesNameLabel()
        createSeriesRatingLabel()
        createSeriesGenreLabel()
        createSeriesCountryAndSeasonsCountAndYearLabel()
        createSeriesOverviewLabel()
    }

    func createPosterImageView() {
        let imageView = SeriesImageView()
        imageView.backgroundColor = .systemBlue
        posterImageView = imageView
    }

    func createSeriesNameLabel() {
        let label = UILabel(with: Fonts.searchDetailModuleSeriesNameLabel)
        seriesNameLabel = label
    }

    func createSeriesRatingLabel() {
        let label = UILabel(with: Fonts.searchDetailModuleSeriesRatingLabel)
        seriesRatingLabel = label
    }

    func createSeriesGenreLabel() {
        let label = UILabel(with: Fonts.searchDetailModuleGenreLabel)
        seriesGenreLabel = label
    }

    func createSeriesCountryAndSeasonsCountAndYearLabel() {
        let label = UILabel(with: Fonts.searchDetailModuleCountrySeasonsAndYearLabel)
        seriesCountryAndSeasonsCountAndYearLabel = label
    }

    func createSeriesOverviewLabel() {
        let label = UILabel(with: Fonts.searchModuleSecondaryLabel)
        seriesOverviewLabel = label
    }
}

//
//  BaseTableViewCell+Extensions.swift
//  iShowTime
//
//  Created by user on 18/10/2023.
//

import UIKit

extension BaseTableViewCell {
    func setupImageView() {
        let imageView = SeriesImageView()
        posterImageView = imageView
    }

    func setupTitleLabel() {
        let label = UILabel(font: Fonts.SearchModule.titleFont)
        titleLabel = label
    }

    func setupGenreLabel() {
        let label = UILabel(font: Fonts.SearchModule.secondaryLabel)
        genreLabel = label
    }

    func setupCountryAndYearLabel() {
        let label = UILabel(font: Fonts.SearchModule.secondaryLabel, color: .systemGray)
        countryAndYearLabel = label
    }

    func setupSeasonsLabel() {
        let label = UILabel(font: Fonts.SearchModule.secondaryLabel, color: .systemGray)
        seasonsLabel = label
    }

    func setupSeriesProgressView() {
        let progressView = SeriesProgressView(25)
        self.progressView = progressView
    }
}

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

    func setupSecondaryLabel() {
        let label = UILabel(font: Fonts.SearchModule.secondaryLabel)
        secondaryLabel = label
    }

    func setupTertiaryLabel() {
        let label = UILabel(font: Fonts.SearchModule.secondaryLabel, color: .systemGray)
        tertiaryLabel = label
    }

    func setupSeriesProgressView() {
        let progressView = SeriesProgressView(25)
        self.progressView = progressView
    }
}

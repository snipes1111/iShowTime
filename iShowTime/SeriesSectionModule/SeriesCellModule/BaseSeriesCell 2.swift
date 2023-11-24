//
//  BaseSeriesCell.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 27/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

class BaseSeriesCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var titleLabel: UILabel!
    var countryAndYearLabel: UILabel!
    var productionStatusLabel: UILabel!
    var seasonsLabel: UILabel!
    var progressView: SeriesProgressView!
    private var vStack: UIStackView!
    private var hStack: UIStackView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit()  {
        setupSubviews()
        setupConstraints()
    }
}

extension BaseSeriesCell {
    private func setupSubviews() {
        posterImageView = SeriesImageView()
        titleLabel = UILabel(font: Fonts.seriesName, color: Colors.title)
        countryAndYearLabel = UILabel(font: Fonts.seriesInfo, color: Colors.info)
        productionStatusLabel = UILabel(font: Fonts.seriesInfo, color: Colors.info)
        seasonsLabel = UILabel(font: Fonts.seriesInfo, color: Colors.info)
        progressView = SeriesProgressView(height: 15)
        vStack = VerticalStackView(spacing: 4, arrangedSubviews: [titleLabel,
                                                                      countryAndYearLabel,
                                                                      productionStatusLabel,
                                                                      seasonsLabel,
                                                                      UIView(),
                                                                      progressView])
        hStack = HorizontalStackView(arrangedSubviews: [posterImageView, vStack])
        contentView.addSubview(hStack)
    }

    private func setupConstraints() {
        vStack.setCustomSpacing(8, after: titleLabel)
        posterImageView.setWidth(100)
        hStack.fillSuperView(contentView, padding: 8)
    }
}

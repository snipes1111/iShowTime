//
//  SeriesCell.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import UIKit

class BaseSeriesCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var titleLabel: UILabel!
    var countryAndYearLabel: UILabel!
    var productionStatusLabel: UILabel!
    var seasonsLabel: UILabel!
    var progressView: SeriesProgressView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseSeriesCell {
    private func setupView() {
        setupSubViews()
        let vStack = VerticalStackView(spacing: 4, arrangedSubviews: [titleLabel,
                                                                      countryAndYearLabel,
                                                                      productionStatusLabel,
                                                                      seasonsLabel,
                                                                      UIView(),
                                                                      progressView])
        vStack.setCustomSpacing(8, after: titleLabel)
        let hStack = HorizontalStackView(arrangedSubviews: [posterImageView, vStack])
        contentView.addSubview(hStack)
        makeConstraints(hStack)
    }

    private func setupSubViews() {
        posterImageView = SeriesImageView()
        titleLabel = UILabel(font: Fonts.seriesName, color: Colors.title)
        countryAndYearLabel = UILabel(font: Fonts.seriesInfo, color: Colors.info)
        productionStatusLabel = UILabel(font: Fonts.seriesInfo, color: Colors.info)
        seasonsLabel = UILabel(font: Fonts.seriesInfo, color: Colors.info)
        progressView = SeriesProgressView(height: 15)
    }

    private func makeConstraints(_ view: UIView) {
        posterImageView.setWidth(100)
        view.fillSuperView(contentView, padding: 8)
    }
}

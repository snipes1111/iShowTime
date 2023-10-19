//
//  BaseTableViewCell.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var titleLabel: UILabel!
    var genreLabel: UILabel!
    var countryAndYearLabel: UILabel!
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

extension BaseTableViewCell {
    private func setupView() {
        setupSubViews()
        let vStack = VerticalStackView(arrangedSubviews: [titleLabel,
                                                          genreLabel,
                                                          countryAndYearLabel,
                                                          seasonsLabel,
                                                          UIView(),
                                                          progressView
                                                         ])
        let hStack = HorizontalStackView(arrangedSubviews: [posterImageView, vStack])
        contentView.addSubview(hStack)
        makeConstraints(hStack)
    }

    private func setupSubViews() {
        setupImageView()
        setupTitleLabel()
        setupGenreLabel()
        setupCountryAndYearLabel()
        setupSeasonsLabel()
        setupSeriesProgressView()
    }

    private func makeConstraints(_ view: UIView) {
        posterImageView.setWidth(100)
        view.fillSuperView(contentView, padding: 8)
    }
}

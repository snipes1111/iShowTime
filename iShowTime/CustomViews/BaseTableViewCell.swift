//
//  BaseTableViewCell.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var seriesTitleLabel: UILabel!
    var seriesSecondaryLabel: UILabel!
    var seriesTertiaryLabel: UILabel!
    var seriesProgressView: SeriesProgressView!

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
        let vStack = VerticalStackView(arrangedSubviews: [seriesTitleLabel,
                                                          seriesSecondaryLabel,
                                                          seriesTertiaryLabel,
                                                          UIView(),
                                                          seriesProgressView
                                                         ])
        let hStack = HorizontalStackView(arrangedSubviews: [posterImageView, vStack])
        contentView.addSubview(hStack)
        makeConstraints(hStack)
    }

    private func makeConstraints(_ view: UIView) {
        posterImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.fillSuperView(contentView, padding: 8)
    }

    private func setupSubViews() {
        setupImageView()
        setupTitleLabel()
        setupSecondaryLabel()
        setupTertiaryLabel()
        setupSeriesProgressView()
    }
}

extension BaseTableViewCell {
    private func setupImageView() {
        let imageView = SeriesImageView()
        posterImageView = imageView
    }

    private func setupTitleLabel() {
        let label = UILabel(with: Fonts.searchModuleSeriesTitleFont)
        seriesTitleLabel = label
    }

    private func setupSecondaryLabel() {
        let label = UILabel(with: Fonts.searchModuleSecondaryLabel)
        seriesSecondaryLabel = label
    }

    private func setupTertiaryLabel() {
        let label = UILabel(with: Fonts.searchModuleSecondaryLabel, and: .systemGray)
        seriesTertiaryLabel = label
    }

    private func setupSeriesProgressView() {
        let progressView = SeriesProgressView(25)
        seriesProgressView = progressView
    }
}

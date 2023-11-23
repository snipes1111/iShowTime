//
//  BaseDetailCell.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

class BaseDetailCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var nameLabel: UILabel!
    var vStack: UIStackView!
    var seriesButton: UIButton!

    private override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupSubviews()
        setupConstraints()
    }

    func setupConstraints() {
        posterImageView.setSize(300, 200)
        vStack.fillSuperView(contentView, padding: 16)
        vStack.setCustomSpacing(24, after: posterImageView)
        vStack.setCustomSpacing(12, after: nameLabel)
    }

    func setupSubviews() {
        posterImageView = SeriesImageView()
        posterImageView.addShadow()
        nameLabel = UILabel(font: Fonts.DetailCell.seriesName)
        nameLabel.textAlignment = .center
        seriesButton = SeriesButton()
        vStack = VerticalStackView(spacing: 10, arrangedSubviews: [posterImageView, nameLabel])
        vStack.alignment = .center
        contentView.addSubview(vStack)
    }
}

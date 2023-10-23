//
//  BaseDetailCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

class BaseDetailCell: UITableViewCell {
    var posterImageView: SeriesImageView!
    var nameLabel: UILabel!
    var vStack: UIStackView!
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
        let vStack = VerticalStackView(spacing: 10, arrangedSubviews: [posterImageView, nameLabel])
        vStack.alignment = .center
        vStack.setCustomSpacing(24, after: posterImageView)
        vStack.setCustomSpacing(12, after: nameLabel)
        contentView.addSubview(vStack)
        makeConstraints(vStack)
        self.vStack = vStack
    }

    func makeConstraints(_ view: UIView) {
        posterImageView.setSize(300, 200)
        view.fillSuperView(contentView, padding: 18)
    }

    func setupSubViews() {
        posterImageView = SeriesImageView()
        posterImageView.addShadow()
        nameLabel = UILabel(font: Fonts.SearchDetailModule.seriesNameLabel)
        nameLabel.textAlignment = .center
        watchingNowButton = WatchingNowButton()
    }

}

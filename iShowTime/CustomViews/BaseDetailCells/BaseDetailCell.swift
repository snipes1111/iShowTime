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
        let vStack = VerticalStackView(spacing: 8, arrangedSubviews: [posterImageView, nameLabel])
        vStack.alignment = .center
        contentView.addSubview(vStack)
        makeConstraints(vStack)
        self.vStack = vStack
    }

    func makeConstraints(_ view: UIView) {
        posterImageView.setSize(300, 200)
        nameLabel.setHeight(75)
        view.fillSuperView(contentView, padding: 18)
    }

    func setupSubViews() {
        createPosterImageView()
        createSeriesNameLabel()
    }

}

extension BaseDetailCell {
    func createPosterImageView() {
        let imageView = SeriesImageView()
        imageView.addShadow()
        posterImageView = imageView
    }

    func createSeriesNameLabel() {
        let label = UILabel(font: Fonts.SearchDetailModule.seriesNameLabel)
        label.textAlignment = .center
        nameLabel = label
    }
}

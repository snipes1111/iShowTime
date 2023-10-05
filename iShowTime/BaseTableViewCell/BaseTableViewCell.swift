//
//  BaseTableViewCell.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "film")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()

    lazy var seriesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title of the series"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()

    lazy var seriesSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Season 1"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    lazy var seriesTertiaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Episode 10"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()

    lazy var seriesProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        progressView.trackTintColor = .lightGray.withAlphaComponent(0.4)
        progressView.progressTintColor = .systemGreen
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        progressView.layer.cornerRadius = 25 / 2
        progressView.clipsToBounds = true
        return progressView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseTableViewCell {
    private func setupViews() {

        let vStack = UIStackView(arrangedSubviews: [seriesTitleLabel,
                                                    seriesSecondaryLabel,
                                                    seriesTertiaryLabel,
                                                    UIView(),
                                                    seriesProgressView
                                                    ])
        vStack.axis = .vertical
        vStack.alignment = .fill
        vStack.spacing = 4

        let hStack = UIStackView(arrangedSubviews: [posterImageView, vStack])
        hStack.axis = .horizontal
        hStack.alignment = .fill
        hStack.distribution = .fillProportionally
        hStack.spacing = 12

        contentView.addSubview(hStack)
        makeConstraints(hStack)
    }

    private func makeConstraints(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
    }
}

//
//  WatchingNowSeriesCell.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import UIKit

class WatchingNowSeriesCell: UITableViewCell {

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(systemName: "film")
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private let seriesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title of the series"
        label.font = .boldSystemFont(ofSize: 23)
        label.backgroundColor = .green
        return label
    }()

    private let seriesCurrentSeasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Season 1"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.backgroundColor = .cyan
        return label
    }()

    private let seriesCurrentEpisodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Episode 10"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.backgroundColor = .brown
        return label
    }()

    private let seriesProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        progressView.trackTintColor = .systemGray
        progressView.progressTintColor = .purple
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

extension WatchingNowSeriesCell {
    private func setupViews() {

        let vStack = UIStackView(arrangedSubviews: [seriesTitleLabel,
                                                    seriesCurrentSeasonLabel,
                                                    seriesCurrentEpisodeLabel,
                                                    seriesProgressView,
                                                    UIView()])
        vStack.axis = .vertical
        vStack.alignment = .fill
        vStack.spacing = 12

        let hStack = UIStackView(arrangedSubviews: [posterImageView, vStack])
        hStack.axis = .horizontal
        hStack.alignment = .fill
        hStack.distribution = .fillEqually
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

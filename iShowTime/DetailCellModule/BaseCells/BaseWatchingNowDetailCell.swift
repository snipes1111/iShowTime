//
//  BaseWatchingDetailCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

class BaseWatchingNowDetailCell: DetailCell {

    var descriptionLabel: UILabel!
    var nextEpisodeDateLabel: UILabel!

    var progressView: UIProgressView!

    var seasonLabel: UILabel!
    var seasonPlusButton: UIButton!
    var seasonTF: UITextField!
    var seasonMinusButton: UIButton!

    var episodeLabel: UILabel!
    var episodePlusButton: UIButton!
    var episodeTF: UITextField!
    var episodeMinusButton: UIButton!

    override func setupConstraints() {
        super.setupConstraints()
        progressView.setWidth(contentView.bounds.width * 0.8)
    }

    override func setupSubviews() {
        super.setupSubviews()
        descriptionLabel = UILabel(font: Fonts.DetailCell.seriesInfo)
        nextEpisodeDateLabel = UILabel(font: Fonts.DetailCell.seriesInfo)
        progressView = SeriesProgressView(height: 15)
        setupRowWith(&seasonLabel, &seasonMinusButton, &seasonTF, &seasonPlusButton)
        setupRowWith(&episodeLabel, &episodeMinusButton, &episodeTF, &episodePlusButton)

        let hStack = createCountingStack()
        hStack.spacing = 18
        vStack.addArrangedSubviews([descriptionLabel, nextEpisodeDateLabel, progressView, hStack, seriesButton])
        vStack.setCustomSpacing(16, after: nextEpisodeDateLabel)
        vStack.setCustomSpacing(32, after: progressView)
        vStack.setCustomSpacing(32, after: hStack)
    }
}

extension BaseWatchingNowDetailCell {

    private func setupRowWith( _ label: inout UILabel?, _ minusButton: inout UIButton?,
                               _ textfield: inout UITextField?, _ plusButton: inout UIButton?) {
        label = UILabel(font: Fonts.DetailCell.seasonAndEpisode)
        minusButton = CountButton(countType: .minus)
        textfield = CountTextField()
        plusButton = CountButton(countType: .plus)
    }

    private func createCountingStack() -> UIStackView {
        let items = [[seasonLabel, episodeLabel],
                     [seasonMinusButton, episodeMinusButton],
                     [seasonTF, episodeTF],
                     [seasonPlusButton, episodePlusButton]]

        let stackViews = items.map {
            VerticalStackView(spacing: 16, distribution: .fillEqually, arrangedSubviews: $0)
        }
        return UIStackView(arrangedSubviews: stackViews)
    }
}

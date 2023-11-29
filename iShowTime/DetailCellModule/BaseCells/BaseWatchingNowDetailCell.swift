//
//  BaseWatchingNowDetailCell.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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
    private var hStack: UIStackView!

    override func setupConstraints() {
        super.setupConstraints()
        progressView.setSize(15, contentView.bounds.width * 0.85)
        vStack.setCustomSpacing(16, after: nextEpisodeDateLabel)
        vStack.setCustomSpacing(32, after: progressView)
        vStack.setCustomSpacing(32, after: hStack)
    }

    override func setupSubviews() {
        super.setupSubviews()
        descriptionLabel = UILabel(font: Fonts.DetailCell.seriesInfo)
        nextEpisodeDateLabel = UILabel(font: Fonts.DetailCell.seriesInfo)
        progressView = SeriesProgressView(bordered: true)
        setupRowWith(&seasonLabel, &seasonMinusButton, &seasonTF, &seasonPlusButton)
        setupRowWith(&episodeLabel, &episodeMinusButton, &episodeTF, &episodePlusButton)
        hStack = createCountingStack()
        vStack.addArrangedSubviews([descriptionLabel, nextEpisodeDateLabel, progressView, hStack, seriesButton])
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
        return HorizontalStackView(spacing: 18, arrangedSubviews: stackViews)
    }
}

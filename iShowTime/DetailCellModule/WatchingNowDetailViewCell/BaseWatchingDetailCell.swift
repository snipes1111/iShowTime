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

    override func setupView() {
        super.setupView()
        let hStack = createCountingStack()
        hStack.spacing = 18
        vStack.addArrangedSubviews([descriptionLabel, nextEpisodeDateLabel, progressView, hStack, watchingNowButton])
        vStack.setCustomSpacing(16, after: nextEpisodeDateLabel)
        vStack.setCustomSpacing(32, after: progressView)
        vStack.setCustomSpacing(32, after: hStack)
    }

    override func makeConstraints(_ view: UIView) {
        super.makeConstraints(view)
        progressView.setWidth(contentView.bounds.width * 0.8)
    }

    override func setupSubViews() {
        super.setupSubViews()
        setupUI()
    }
}

extension BaseWatchingNowDetailCell {

    func setupUI() {
        descriptionLabel = UILabel(font: Fonts.WatchingNowModule.description)
        nextEpisodeDateLabel = UILabel(font: Fonts.WatchingNowModule.description)
        progressView = SeriesProgressView(15)
        setupRowWith(&seasonLabel, &seasonMinusButton, &seasonTF, &seasonPlusButton)
        setupRowWith(&episodeLabel, &episodeMinusButton, &episodeTF, &episodePlusButton)
    }

    private func setupRowWith( _ label: inout UILabel?, _ minusButton: inout UIButton?,
                               _ textfield: inout UITextField?, _ plusButton: inout UIButton?) {
        label = UILabel(font: Fonts.WatchingNowModule.seasonAndEpisode)
        minusButton = CountButton(type: .minus)
        textfield = CountTextField()
        plusButton = CountButton(type: .plus)
    }

    func createCountingStack() -> UIStackView {
        let items = [[seasonLabel, episodeLabel],
                     [seasonMinusButton, episodeMinusButton],
                     [seasonTF, episodeTF],
                     [seasonPlusButton, episodePlusButton]]

        let stackViews = items.map { VerticalStackView(spacing: 16,
                                                       arrangedSubviews: $0,
                                                       distribution: .fillEqually) }
        return UIStackView(arrangedSubviews: stackViews)
    }
}

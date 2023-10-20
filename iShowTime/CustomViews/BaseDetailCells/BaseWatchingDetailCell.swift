//
//  BaseWatchingDetailCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

class BaseWatchingDetailCell: BaseDetailCell {

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

    var removeButton: UIButton!

    override func setupView() {
        super.setupView()
        let hStack = createCountingStack()
        hStack.spacing = 18
        vStack.addArrangedSubviews([descriptionLabel, nextEpisodeDateLabel, progressView, hStack, removeButton])
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

extension BaseWatchingDetailCell {

    func setupUI() {
        descriptionLabel = UILabel(font: Fonts.WatchingNowModule.description)
        descriptionLabel.text = "Seasons: 3 • Status: In Production"
        nextEpisodeDateLabel = UILabel(font: Fonts.WatchingNowModule.description)
        nextEpisodeDateLabel.text = "Next Episode Air Date: 11.11.11"
        progressView = SeriesProgressView(15)
        seasonLabel = UILabel(font: Fonts.WatchingNowModule.seasonAndEpisode, text: "Season")
        seasonPlusButton = CountButton(type: .plus)
        seasonTF = CountTextField()
        seasonMinusButton = CountButton(type: .minus)
        episodeLabel = UILabel(font: Fonts.WatchingNowModule.seasonAndEpisode, text: "Episode")
        episodePlusButton = CountButton(type: .plus)
        episodeTF = CountTextField()
        episodeMinusButton = CountButton(type: .minus)
        removeButton = WatchingNowButton()
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

extension BaseWatchingDetailCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {

    }
}

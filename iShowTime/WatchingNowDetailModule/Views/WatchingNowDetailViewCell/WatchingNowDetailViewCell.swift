//
//  WatchingNowDetailViewCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

class WatchingNowDetailViewCell: BaseWatchingDetailCell {

    var viewModel: WatchingNowDetailCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else { return }
            posterImageView.getImage(viewModel.imageUrl)
            nameLabel.text = viewModel.seriesName
            descriptionLabel.text = viewModel.description
            nextEpisodeDateLabel.text = viewModel.nextEpisodeDate
            seasonLabel.text = viewModel.season
            episodeLabel.text = viewModel.episode
            seasonTF.text = viewModel.seasonTFText
            episodeTF.text = viewModel.episodeTFText
            progressView.progress = viewModel.seriesProgress
            setupRemoveButton()
            seasonPlusButton.addTarget(self, action: #selector(plusSeason), for: .touchUpInside)
            seasonMinusButton.addTarget(self, action: #selector(minusSeason), for: .touchUpInside)
            episodePlusButton.addTarget(self, action: #selector(plusEpisode), for: .touchUpInside)
            episodeMinusButton.addTarget(self, action: #selector(minusEpisode), for: .touchUpInside)
        }
    }

    @objc private func buttonPressed() {
        viewModel?.watchingNowButtonPressed()
        updateRemoveButton()
    }
}

extension WatchingNowDetailViewCell {

    private func updateRemoveButton() {
        guard let isSaved = viewModel?.seriesIsSaved else { return }
        if !isSaved {
            removeButton.setTitle(SearchModuleConstants.addToWatchingNow, for: .normal)
            removeButton.setTitleColor(.black, for: .normal)
        } else {
            removeButton.setTitle(SearchModuleConstants.removeFromWatchingNow, for: .normal)
            removeButton.setTitleColor(.darkGray, for: .normal)
        }
    }

    private func setupRemoveButton() {
        updateRemoveButton()
        removeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc private func plusSeason() {
        guard let text = seasonTF.text,
              let count = Int(text) else { return }
        seasonTF.text = "\(count + 1)"
    }

    @objc private func minusSeason() {
        guard let text = seasonTF.text,
              let count = Int(text) else { return }
        seasonTF.text = "\(count - 1)"
    }

    @objc private func plusEpisode() {
        guard let text = episodeTF.text,
              let count = Int(text) else { return }
        episodeTF.text = "\(count + 1)"
    }

    @objc private func minusEpisode() {
        guard let text = episodeTF.text,
              let count = Int(text) else { return }
        episodeTF.text = "\(count - 1)"
    }
}

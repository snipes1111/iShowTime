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
            updateUI()
            setupRemoveButton()
            addButtonsTargets()
        }
    }

    @objc private func buttonPressed() {
        viewModel?.watchingNowButtonPressed()
        updateRemoveButton()
    }
}

extension WatchingNowDetailViewCell {

    func addButtonsTargets() {
        seasonPlusButton.addAction(createAction(for: .season, increment: true), for: .touchUpInside)
        seasonMinusButton.addAction(createAction(for: .season, increment: false), for: .touchUpInside)
        episodePlusButton.addAction(createAction(for: .episode, increment: true), for: .touchUpInside)
        episodeMinusButton.addAction(createAction(for: .episode, increment: false), for: .touchUpInside)
    }

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

    func createAction(for counterType: CounterType, increment: Bool) -> UIAction {
        let action = UIAction { [unowned self] _ in
            if increment {
                viewModel?.increment(counterType)
            } else {
                viewModel?.decrement(counterType)
            }
            updateUI()
        }
        return action
    }

    func updateUI() {
        guard let viewModel = viewModel else { return }
        seasonTF.text = viewModel.seasonTFText
        episodeTF.text = viewModel.episodeTFText
        progressView.progress = viewModel.seriesProgress
    }
}

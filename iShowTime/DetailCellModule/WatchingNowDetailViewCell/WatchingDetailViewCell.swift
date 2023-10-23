//
//  WatchingNowDetailViewCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailViewCell: BaseWatchingNowDetailCell {

    private lazy var detailViewModel: WatchingNowDetailCellViewModelProtocol? = {
        return (viewModel as? WatchingNowDetailCellViewModelProtocol) ?? nil
    }()

    override func updateViews() {
        super.updateViews()
        guard let viewModel = detailViewModel else { return }
        descriptionLabel.text = viewModel.description
        nextEpisodeDateLabel.text = viewModel.nextEpisodeDate
        seasonLabel.text = viewModel.season
        episodeLabel.text = viewModel.episode
        setProgress()
        addButtonsTargets()
    }
}

extension WatchingNowDetailViewCell {

    func addButtonsTargets() {
        seasonPlusButton.addAction(createAction(for: .season, increment: true), for: .touchUpInside)
        seasonMinusButton.addAction(createAction(for: .season, increment: false), for: .touchUpInside)
        episodePlusButton.addAction(createAction(for: .episode, increment: true), for: .touchUpInside)
        episodeMinusButton.addAction(createAction(for: .episode, increment: false), for: .touchUpInside)
    }

    func createAction(for counterType: CounterType, increment: Bool) -> UIAction {
        let action = UIAction { [unowned self] _ in
            if increment {
                detailViewModel?.increment(counterType)
            } else {
                detailViewModel?.decrement(counterType)
            }
            setProgress()
        }
        return action
    }

    func setProgress() {
        guard let viewModel = detailViewModel else { return }
        seasonTF.text = viewModel.seasonTFText
        episodeTF.text = viewModel.episodeTFText
        progressView.progress = viewModel.seriesProgress
    }
}

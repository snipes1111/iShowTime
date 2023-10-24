//
//  WatchingNowDetailViewCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailViewCell: BaseWatchingNowDetailCell {

    private var detailViewModel: WatchingNowDetailCellViewModelProtocol?

    override func updateViews() {
        super.updateViews()
        detailViewModel = (viewModel as? WatchingNowDetailCellViewModelProtocol)
        descriptionLabel.text = detailViewModel?.description
        nextEpisodeDateLabel.text = detailViewModel?.nextEpisodeDate
        seasonLabel.text = detailViewModel?.seasonText
        episodeLabel.text = detailViewModel?.episodeText
        setProgress()
        addButtonsTargets()
        seasonTF.addAction(createSeasonTFAction(), for: .editingDidEnd)
        episodeTF.addAction(createEpisodeTFAction(), for: .editingDidEnd)
    }
}

extension WatchingNowDetailViewCell {

    private func addButtonsTargets() {
        seasonPlusButton.addAction(createAction(for: .season, increment: true),
                                   for: .touchUpInside)
        seasonMinusButton.addAction(createAction(for: .season, increment: false),
                                    for: .touchUpInside)
        episodePlusButton.addAction(createAction(for: .episode, increment: true),
                                    for: .touchUpInside)
        episodeMinusButton.addAction(createAction(for: .episode, increment: false),
                                     for: .touchUpInside)
    }

    private func createSeasonTFAction() -> UIAction {
        let action = UIAction { [unowned self] _ in
            detailViewModel?.setSeasonCount(seasonTF.text)
            setProgress()
        }
        return action
    }

    private func createEpisodeTFAction() -> UIAction {
        let action = UIAction { [unowned self] _ in
            detailViewModel?.setEpisodeCount(episodeTF.text)
            setProgress()
        }
        return action
    }

    private func createAction(for counterType: CounterType, increment: Bool) -> UIAction {
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

    private func setProgress() {
        guard let viewModel = detailViewModel else { return }
        seasonTF.text = viewModel.seasonTFText
        episodeTF.text = viewModel.episodeTFText
        progressView.progress = viewModel.seriesProgress
    }
}

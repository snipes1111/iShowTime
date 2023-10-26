//
//  WatchingNowDetailCell.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailCell: BaseWatchingNowDetailCell {

    private var detailViewModel: WatchingNowDetailCellViewModelProtocol?

    override func updateViews() {
        super.updateViews()
        detailViewModel = (viewModel as? WatchingNowDetailCellViewModelProtocol)
        descriptionLabel.text = detailViewModel?.description
        nextEpisodeDateLabel.text = detailViewModel?.nextEpisodeDate
        seasonLabel.text = detailViewModel?.seasonText
        episodeLabel.text = detailViewModel?.episodeText
        seasonTF.text = detailViewModel?.seasonTFText
        episodeTF.text = detailViewModel?.episodeTFText
        progressView.progress = detailViewModel?.seriesProgress ?? 0
    }

    override func setupSubViews() {
        super.setupSubViews()
        addActionsToButtons()
        addActionsToTextfields()
    }
}

extension WatchingNowDetailCell {

    private func addActionsToTextfields() {
        seasonTF.addAction(createTFAction(.season), for: .editingDidEnd)
        episodeTF.addAction(createTFAction(.episode), for: .editingDidEnd)
    }

    private func addActionsToButtons() {
        seasonPlusButton.addAction(createButtonAction(for: .season, increment: true),
                                   for: .touchUpInside)
        seasonMinusButton.addAction(createButtonAction(for: .season, increment: false),
                                    for: .touchUpInside)
        episodePlusButton.addAction(createButtonAction(for: .episode, increment: true),
                                    for: .touchUpInside)
        episodeMinusButton.addAction(createButtonAction(for: .episode, increment: false),
                                     for: .touchUpInside)
    }

    private func createTFAction(_ counterType: CounterType) -> UIAction {
        let action = UIAction { [unowned self] _ in
            switch counterType {
            case .episode: detailViewModel?.setEpisodeCount(episodeTF.text)
            case .season: detailViewModel?.setSeasonCount(seasonTF.text)
            }
            updateProgress()
        }
        return action
    }

    private func createButtonAction(for counterType: CounterType, increment: Bool) -> UIAction {
        let action = UIAction { [unowned self] _ in
            if increment {
                detailViewModel?.increment(counterType)
            } else {
                detailViewModel?.decrement(counterType)
            }
            updateProgress()
        }
        return action
    }

    private func updateProgress() {
        guard let viewModel = detailViewModel else { return }
        seasonTF.text = viewModel.seasonTFText
        episodeTF.text = viewModel.episodeTFText
        progressView.setProgress(viewModel.seriesProgress, animated: true)
    }
}

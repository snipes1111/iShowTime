//
//  WatchingNowDetailCell.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class WatchingNowDetailCell: BaseWatchingNowDetailCell {
    
    private var detailViewModel: WatchingNowDetailCellViewModelProtocol? {
        viewModel as? WatchingNowDetailCellViewModelProtocol
    }

    override func updateViews() {
        super.updateViews()
        descriptionLabel.text = detailViewModel?.description
        nextEpisodeDateLabel.text = detailViewModel?.nextEpisodeDate
        seasonLabel.text = detailViewModel?.seasonText
        episodeLabel.text = detailViewModel?.episodeText
        updateProgress()
    }

    override func setupSubviews() {
        super.setupSubviews()
        addActionsToButtons()
        addActionsToTextfields()
    }
}

extension WatchingNowDetailCell {

    private func addActionsToTextfields() {
        seasonTF.addAction(UIAction(seasonTFAction), for: .editingDidEnd)
        episodeTF.addAction(UIAction(episodeTFAction), for: .editingDidEnd)
    }

    private func addActionsToButtons() {
        seasonPlusButton.addAction(UIAction(seasonPlusAction), for: .touchUpInside)
        seasonMinusButton.addAction(UIAction(seasonMinusAction), for: .touchUpInside)
        episodePlusButton.addAction(UIAction(episodePlusAction), for: .touchUpInside)
        episodeMinusButton.addAction(UIAction(episodeMinusAction), for: .touchUpInside)
    }

    private func seasonTFAction() {
        detailViewModel?.setCount(seasonTF.text, .season)
        updateProgress()
    }

    private func episodeTFAction() {
        detailViewModel?.setCount(episodeTF.text, .episode)
        updateProgress()
    }

    private func seasonPlusAction() {
        detailViewModel?.increment(.season)
        updateProgress()
    }

    private func seasonMinusAction() {
        detailViewModel?.decrement(.season)
        updateProgress()
    }

    private func episodePlusAction() {
        detailViewModel?.increment(.episode)
        updateProgress()
    }

    private func episodeMinusAction() {
        detailViewModel?.decrement(.episode)
        updateProgress()
    }

    private func updateProgress() {
        seasonTF.text = detailViewModel?.seasonTFText
        episodeTF.text = detailViewModel?.episodeTFText
        guard let progress = detailViewModel?.progress else { return }
        progressView.setProgress(progress, animated: true)
        //setProgressColor(progress: progress)
    }

//    private func setProgressColor(progress: Float) {
//        let color: UIColor
//        switch progress {
//        case 0..<0.3: color = UIColor.systemOrange
//        case 0.3..<0.7: color = UIColor.systemYellow
//        default: color = UIColor.systemGreen
//        }
//        progressView.progressTintColor = color
//    }
}

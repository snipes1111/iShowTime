//
//  SearchDetailSeriesCell.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

final class SearchDetailCell: BaseSearchDetailCell {

    private var detailViewModel: SearchDetailCellViewModelProtocol?

    override func updateViews() {
        super.updateViews()
        detailViewModel = (viewModel as? SearchDetailCellViewModelProtocol)
        updateRating()
        genreLabel.text = detailViewModel?.genreAndYear
        countrySeasonsAndYearLabel.text = detailViewModel?.countrySeasonsAndYear
        updateOverview()
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
}

extension SearchDetailCell {
    private func updateRating() {
        ratingIsLabel.text = detailViewModel?.ratingIs
        ratingScoreLabel.text = detailViewModel?.scoreRating
        ratingScoreLabel.textColor = getColor()
    }

    private func updateOverview() {
        guard let viewModel = detailViewModel else { return }
        let text = viewModel.attributedOverviewText + viewModel.overview
        overviewLabel.text = text
        overviewLabel.addTextAttributes(for: viewModel.attributedOverviewText)
    }

    private func getColor() -> UIColor {
        guard let color = detailViewModel?.scoreRatingColor else { return .black }
        switch color {
        case .black: return Colors.blackRating
        case .red: return Colors.redRating
        case .yellow: return Colors.yellowRating
        case .green: return Colors.greenRating
        }
    }

    @objc private func heartButtonTapped() {
        detailViewModel?.heartButtonDidTapped()
        updateHeartButton()
    }

    private func updateHeartButton() {
        guard let viewModel = detailViewModel else { return }
        if viewModel.seriesIsFavourite {
            heartButton.switchToShadedState()
        } else {
            heartButton.switchToBorderedState()
        }
    }
}

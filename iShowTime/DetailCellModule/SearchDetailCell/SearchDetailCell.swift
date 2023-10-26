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
        case .black: return .black
        case .red: return .systemRed.withAlphaComponent(0.9)
        case .yellow: return .systemOrange
        case .green: return .systemGreen.withAlphaComponent(0.9)
        }
    }
}

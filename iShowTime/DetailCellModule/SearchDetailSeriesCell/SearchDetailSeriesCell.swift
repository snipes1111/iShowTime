//
//  SearchDetailSeriesCell.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

final class SearchDetailSeriesCell: BaseSearchDetailCell {

    private lazy var detailViewModel: SearchDetailCellViewModelProtocol? = {
        return (viewModel as? SearchDetailCellViewModelProtocol) ?? nil
    }()

    override func updateViews() {
        super.updateViews()
        guard let viewModel = detailViewModel else { return }
        updateRating()
        genreLabel.text = viewModel.genreAndYear
        countrySeasonsAndYearLabel.text = viewModel.countrySeasonsAndYear
        updateOverview()
    }
}

extension SearchDetailSeriesCell {
    private func updateRating() {
        guard let viewModel = detailViewModel else { return }
        ratingIsLabel.text = viewModel.ratingIs
        ratingScoreLabel.text = viewModel.scoreRating
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
        case .green: return .systemGreen.withAlphaComponent(0.8)
        case .red: return .systemRed.withAlphaComponent(0.8)
        case .yellow: return .systemOrange
        }
    }
}

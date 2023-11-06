//
//  SearchDetailSeriesCell.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

protocol CellResizable: AnyObject {
    func resizeCell()
}

final class SeriesDescriptionCell: BaseSeriesDescriptionCell {

    private var detailViewModel: SeriesDescriptionCellViewModelProtocol?
    weak var delegate: CellResizable?

    override func updateViews() {
        super.updateViews()
        detailViewModel = (viewModel as? SeriesDescriptionCellViewModelProtocol)
        updateRating()
        genreLabel.text = detailViewModel?.genreAndYear
        countrySeasonsAndYearLabel.text = detailViewModel?.countrySeasonsAndYear
        updateOverview()
        setupHeartButton()
        createButtonAction()
        updateShowMoreButtonStack()
    }

    func createButtonAction() {
        showMoreButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        overviewLabel.numberOfLines = 0
        showMoreButtonStack.isHidden = true
        delegate?.resizeCell()
    }

    private func updateShowMoreButtonStack() {
        guard let text = detailViewModel?.overview else { return }
        let estimatedHeight = text.estimatedLabelHeight(width: overviewLabel.bounds.width,
                                                        font: overviewLabel.font)
        let stackIsHidden = estimatedHeight <= overviewLabel.bounds.height
        showMoreButton.isHidden = stackIsHidden
    }

}

extension SeriesDescriptionCell {
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

    private func setupHeartButton() {
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        updateHeartButton()
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

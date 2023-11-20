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

    private var detailViewModel: SeriesDescriptionCellViewModelProtocol? {
        viewModel as? SeriesDescriptionCellViewModelProtocol
    }
    weak var delegate: CellResizable?

    override func updateViews() {
        super.updateViews()
        ratingIsLabel.text = detailViewModel?.ratingIs
        ratingScoreLabel.text = detailViewModel?.scoreRating
        ratingScoreLabel.textColor = getColor()
        genreLabel.text = detailViewModel?.genreAndYear
        countrySeasonsAndYearLabel.text = detailViewModel?.countrySeasonsAndYear
        overviewLabel.text = detailViewModel?.overview
        overviewLabel.addTextAttributes(for: detailViewModel?.attributedOverviewText)
        heartButton.setIsFavourite(detailViewModel?.seriesIsFavourite)
        heartButton.addAction(UIAction(heartButtonTapped), for: .touchUpInside)
        showMoreButton.addAction(UIAction(buttonTapped), for: .touchUpInside)
        setShowMoreButtonStackIsHidden()
    }

   @objc private func buttonTapped() {
        overviewLabel.numberOfLines = 0
        showMoreButtonStack.isHidden = true
        delegate?.resizeCell()
    }

    private func setShowMoreButtonStackIsHidden() {
        guard let text = detailViewModel?.overview else { return }
        let estimatedHeight = text.estimatedLabelHeight(width: overviewLabel.bounds.width,
                                                        font: overviewLabel.font)
        let stackIsHidden = estimatedHeight <= overviewLabel.bounds.height
        showMoreButtonStack.isHidden = stackIsHidden
    }

}

extension SeriesDescriptionCell {

    private func getColor() -> UIColor? {
        guard let color = detailViewModel?.scoreRatingColor else { return nil }
        switch color {
        case .black: return Colors.blackRating
        case .red: return Colors.redRating
        case .yellow: return Colors.yellowRating
        case .green: return Colors.greenRating
        }
    }

    @objc private func heartButtonTapped() {
        detailViewModel?.heartButtonDidTapped()
        heartButton.setIsFavourite(detailViewModel?.seriesIsFavourite)
    }
}

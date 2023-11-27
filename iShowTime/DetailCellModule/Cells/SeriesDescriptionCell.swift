//
//  SeriesDescriptionCell.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 11/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit


final class SeriesDescriptionCell: BaseSeriesDescriptionCell {

    private var detailViewModel: SeriesDescriptionCellViewModelProtocol? {
        viewModel as? SeriesDescriptionCellViewModelProtocol
    }
    
    override func updateViews() {
        super.updateViews()
        ratingIsLabel.text = detailViewModel?.ratingIs
        ratingScoreLabel.text = detailViewModel?.scoreRating
        ratingScoreLabel.textColor = getColor()
        genreLabel.text = detailViewModel?.genreAndYear
        seasonsAndYearLabel.text = detailViewModel?.countrySeasonsAndYear
        overviewLabel.text = detailViewModel?.overview
        overviewLabel.addTextAttributes(for: detailViewModel?.attributedOverviewText)
        heartButton.setIsFavourite(detailViewModel?.seriesIsFavourite)
    }

    override func setupSubviews() {
        super.setupSubviews()
        heartButton.addAction(UIAction(heartButtonTapped), for: .touchUpInside)
        showMoreButton.addAction(UIAction(buttonTapped), for: .touchUpInside)
    }

   private func buttonTapped() {
        overviewLabel.numberOfLines = 0
        showMoreButton.isHidden = true
        showMoreButtonStack.isHidden = true
        detailViewModel?.showButtonDidTapped()
    }

    private func setShowMoreButtonStackIsHidden() {
        guard let text = detailViewModel?.overview else { return }
        let estimatedHeight = text.estimatedLabelHeight(width: overviewLabel.bounds.width,
                                                        font: overviewLabel.font,
                                                        attributedText: detailViewModel?.attributedOverviewText)
        let stackIsHidden = estimatedHeight <= overviewLabel.bounds.height
        showMoreButtonStack.isHidden = stackIsHidden
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setShowMoreButtonStackIsHidden()
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

    private func heartButtonTapped() {
        detailViewModel?.heartButtonDidTapped()
        heartButton.setIsFavourite(detailViewModel?.seriesIsFavourite)
    }
}

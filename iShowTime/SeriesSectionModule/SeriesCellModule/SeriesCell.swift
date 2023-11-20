//
//  SeriesCell.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import UIKit

class SeriesCell: BaseSeriesCell {
    var viewModel: SeriesCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            countryAndYearLabel.text = viewModel.countryAndYear
            productionStatusLabel.text = viewModel.productionStatus
            seasonsLabel.text = viewModel.seasonsCount
            progressView.isHidden = viewModel.progressIsHidden
            progressView.progress = viewModel.progress
            posterImageView.getImage(viewModel.imageUrl)
        }
    }
}

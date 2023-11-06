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
            titleLabel.text = viewModel.seriesTitle
            genreLabel.text = viewModel.genreLabel
            countryAndYearLabel.text = viewModel.countryAndYear
            seasonsLabel.text = viewModel.seasonsLabelText
            progressView.isHidden = viewModel.progressViewIsHidden
            progressView.progress = viewModel.seriesProgress
            posterImageView.getImage(viewModel.imageUrl)
        }
    }
}

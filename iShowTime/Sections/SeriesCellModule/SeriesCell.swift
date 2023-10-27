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
            genreLabel.text = viewModel.secondaryLabelTitle
            countryAndYearLabel.text = viewModel.tertiaryLabelTitle
            seasonsLabel.isHidden = viewModel.seasonsLabelIsHidden
            seasonsLabel.text = viewModel.seasonsLabelText
            progressView.isHidden = viewModel.progressViewIsHidden
            posterImageView.getImage(viewModel.imageUrl)
        }
    }
}

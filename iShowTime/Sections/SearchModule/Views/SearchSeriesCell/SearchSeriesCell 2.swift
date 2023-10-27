//
//  SearchSeriesCell.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import UIKit

final class SearchSeriesCell: BaseTableViewCell {
    var viewModel: SeriesCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.seriesTitle
            genreLabel.text = viewModel.secondaryLabelTitle
            countryAndYearLabel.text = viewModel.tertiaryLabelTitle
            seasonsLabel.isHidden = viewModel.seasonsLabelIsHidden
            progressView.isHidden = viewModel.progressViewIsHidden
            posterImageView.getImage(viewModel.imageUrl)
        }
    }
}

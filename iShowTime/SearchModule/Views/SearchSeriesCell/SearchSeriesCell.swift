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
            seriesTitleLabel.text = viewModel?.seriesTitle
            seriesSecondaryLabel.text = viewModel?.secondaryLabelTitle
            seriesTertiaryLabel.text = viewModel?.tertiaryLabelTitle
            seriesProgressView.isHidden = viewModel?.progressViewIsVisible ?? true
            posterImageView.getImage(viewModel?.imageUrl)
        }
    }
}

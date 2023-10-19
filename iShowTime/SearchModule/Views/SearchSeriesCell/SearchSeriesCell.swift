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
            titleLabel.text = viewModel?.seriesTitle
            secondaryLabel.text = viewModel?.secondaryLabelTitle
            tertiaryLabel.text = viewModel?.tertiaryLabelTitle
            progressView.isHidden = viewModel?.progressViewIsVisible ?? true
            posterImageView.getImage(viewModel?.imageUrl)
        }
    }
}

//
//  WatchingNowSeriesCell.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import UIKit

class WatchingNowSeriesCell: BaseTableViewCell {
    var viewModel: WatchingNowCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.seriesTitle
            genreLabel.text = viewModel.secondaryLabelTitle
            countryAndYearLabel.text = viewModel.tertiaryLabelTitle
            seasonsLabel.text = viewModel.seasonsLabelText
            progressView.isHidden = viewModel.progressViewIsHidden
            posterImageView.getImage(viewModel.imageUrl)
        }
    }
}

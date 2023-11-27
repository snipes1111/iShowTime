//
//  SeriesCell.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 27/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesCell: BaseSeriesCell {
    var viewModel: SeriesCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            countryAndYearLabel.text = viewModel.countryAndYear
            productionStatusLabel.text = viewModel.productionStatus
            seasonsLabel.text = viewModel.seasonsCount
            progressView.isHidden = viewModel.progressIsHidden
            progressView.setProgress(viewModel.progress, animated: false)
            if let data = viewModel.imageData {
                posterImageView.image = UIImage(data: data)
            } else {
                posterImageView.getImage(viewModel.imageUrl)
            }
        }
    }
}

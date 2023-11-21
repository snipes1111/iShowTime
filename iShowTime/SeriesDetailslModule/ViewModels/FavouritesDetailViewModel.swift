//
//  FavouritesDetailViewModel.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import Foundation

final class FavouritesDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    var cellType: DetailCell.Type { SeriesDescriptionCell.self }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        let viewModel = SeriesDescriptionCellViewModel(seriesData: seriesData)
        viewModel.delegate = self
        return viewModel
    }
}

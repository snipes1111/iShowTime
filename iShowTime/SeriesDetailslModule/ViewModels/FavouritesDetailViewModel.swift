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
        return SeriesDescriptionCellViewModel(seriesData: seriesData)
    }
}

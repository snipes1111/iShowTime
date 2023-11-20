//
//  SearchDetailViewModel.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import Foundation

final class SearchDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    override var tableViewTopInset: Int { 60 }

    var cellType: DetailCell.Type { SeriesDescriptionCell.self }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        SeriesDescriptionCellViewModel(seriesData: seriesData)
    }
}

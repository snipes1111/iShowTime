//
//  WatchingNowDetailViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

final class WatchingNowDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    var cellType: DetailCell.Type { WatchingNowDetailCell.self }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        return WatchingNowDetailCellViewModel(seriesData: seriesData)
    }
}

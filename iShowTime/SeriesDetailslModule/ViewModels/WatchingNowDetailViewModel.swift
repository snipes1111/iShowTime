//
//  WatchingNowDetailViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

final class WatchingNowDetailViewModel: SeriesDetailViewModel {

    override var cellType: DetailCell.Type { WatchingNowDetailCell.self }

    override func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        WatchingNowDetailCellViewModel(seriesData: seriesData)
    }
}

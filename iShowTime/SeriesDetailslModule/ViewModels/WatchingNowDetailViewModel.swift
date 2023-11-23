//
//  WatchingNowDetailViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

final class WatchingNowDetailViewModel: SeriesDetailViewModel {

    override var cellType: DetailCell.Type { WatchingNowDetailCell.self }

    override func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        WatchingNowDetailCellViewModel(seriesData: seriesData)
    }
}

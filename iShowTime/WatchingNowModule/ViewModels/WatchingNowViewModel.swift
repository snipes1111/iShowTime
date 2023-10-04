//
//  WatchingNowViewModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation

protocol WatchingNowViewModelProtocol {

    var numberOfSeries: Int { get }

    init(series: [Series])

}

class WatchingNowViewModel: WatchingNowViewModelProtocol {

    var numberOfSeries: Int {
        series.count
    }

    private let series: [Series]

    required init(series: [Series]) {
        self.series = series
    }

}

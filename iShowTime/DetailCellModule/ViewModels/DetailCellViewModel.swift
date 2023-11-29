//
//  DetailCellViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 23/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

protocol DetailCellViewModelProtocol {
    var seriesName: String { get }
    var imageUrl: String? { get }
    var imageData: Data? { get }
    var isBeingWatched: Bool { get }
    init(seriesData: SeriesData)
    func watchingNowButtonPressed()
}

class DetailCellViewModel: DetailCellViewModelProtocol {

    private lazy var dataStoreManager: DataStoreManagerProtocol = DataStoreManger()
    let seriesData: SeriesData

    var seriesName: String { seriesData.series?.name ?? SeriesConstants.unknownTitle }
    var imageUrl: String? { seriesData.series?.posterPath }
    var imageData: Data? { seriesData.imageData }
    var isBeingWatched: Bool { seriesData.isBeingWatched }

    required init(seriesData: SeriesData) {
        self.seriesData = seriesData
    }

    func setIsFavourite() {
        dataStoreManager.setIsFavourite(seriesData: seriesData)
    }

    func setProgress(seriesProgress: SeriesProgress) {
        dataStoreManager.setSeriesProgress(seriesData: seriesData,
                                           seriesProgress: seriesProgress)
    }

    func watchingNowButtonPressed() {
        dataStoreManager.setIsBeingWatched(seriesData: seriesData)
    }
}

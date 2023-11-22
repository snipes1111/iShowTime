//
//  BaseDetailCellViewModel.swift
//  iShowTime
//
//  Created by user on 23/10/2023.
//

import Foundation

protocol DetailCellViewModelProtocol {
    var seriesName: String { get }
    var imageUrl: String? { get }
    var isBeingWatched: Bool { get }
    init(seriesData: SeriesData)
    func watchingNowButtonPressed()
}

class DetailCellViewModel: DetailCellViewModelProtocol {

    private let dataStoreManager: DataStoreManagerProtocol = DataStoreManger()
    let seriesData: SeriesData

    var seriesName: String { seriesData.series?.name ?? SeriesConstants.unknownTitle }
    var imageUrl: String? { seriesData.series?.posterPath }
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

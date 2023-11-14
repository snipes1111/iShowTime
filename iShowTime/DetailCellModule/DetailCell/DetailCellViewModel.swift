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

    private(set) var seriesData: SeriesData
    private(set) var series: Series

    var countries: String = ""

    let dataStoreManager: DataStoreManagerProtocol = DataStoreManger()

    var seriesName: String { series.name ?? SearchModuleConstants.unknownTitle }
    var imageUrl: String? { series.posterPath }
    var isBeingWatched: Bool { seriesData.isBeingWatched }

    required init(seriesData: SeriesData) {
        self.seriesData = seriesData
        self.series = seriesData.series
    }

    func setIsFavourite() {
        dataStoreManager.setIsFavourite(seriesData: seriesData, countries: countries)
    }

    func setProgress(seriesProgress: SeriesProgress) {
        dataStoreManager.setSeriesProgress(seriesData: seriesData,
                                           seriesProgress: seriesProgress)
    }

    func watchingNowButtonPressed() {
        dataStoreManager.setIsBeingWatched(seriesData: seriesData, countries: countries)
    }
}

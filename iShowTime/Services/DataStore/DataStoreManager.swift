//
//  DataManager.swift
//  iShowTime
//
//  Created by user on 18/10/2023.
//

import Foundation

protocol DataStoreMangerProtocol {
    func save(seriesData: SeriesData)
    func remove(seriesData: SeriesData)
    func seriesList() -> [SeriesData]
    func favouriteSeriesList() -> [SeriesData]
}

struct SeriesData {
    let series: Series
    var isFavourite: Bool
    var isBeingWatched: Bool
    var currentSeason: Double
    var currentEpisode: Double
    var currentProgress: Float

    init(series: Series) {
        self.series = series
        isFavourite = false
        isBeingWatched = false
        currentSeason = 1
        currentEpisode = 0
        currentProgress = 0
    }
}

extension SeriesData: Equatable {
    static func == (lhs: SeriesData, rhs: SeriesData) -> Bool {
        lhs.series.id == rhs.series.id
    }
}


class DataStoreManger: DataStoreMangerProtocol {

    static let shared = DataStoreManger()
    private var storage: [SeriesData] = []

    func save(seriesData: SeriesData) {
        guard !storage.contains(seriesData) else {
            remove(seriesData: seriesData)
            storage.append(seriesData)
            return
        }
        storage.append(seriesData)
        print("Successfully saved")
    }

    func remove(seriesData: SeriesData) {
        guard let index = storage.firstIndex(of: seriesData) else { return }
        storage.remove(at: index)
        print("Successfully removed")
    }

    func seriesList() -> [SeriesData] {
        storage.filter { $0.isBeingWatched == true }
    }

    func favouriteSeriesList() -> [SeriesData] {
        storage.filter { $0.isFavourite == true }
    }
}

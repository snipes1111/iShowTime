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
    func isSavedBefore(seriesData: SeriesData) -> Bool
    func seriesList() -> [SeriesData]
    func favouriteSeriesList() -> [SeriesData]
}

struct SeriesData {
    let series: Series
    var isFavourite: Bool
    var currentSeason: Int
    var currentEpisode: Int
    var currentProgress: Int

    init(series: Series) {
        self.series = series
        self.isFavourite = false
        self.currentSeason = 1
        self.currentEpisode = 0
        self.currentProgress = 0
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

    func isSavedBefore(seriesData: SeriesData) -> Bool {
        storage.filter { $0.isFavourite == false }.contains(seriesData)
    }

    func seriesList() -> [SeriesData] {
        storage.filter { $0.isFavourite == false }
    }

    func favouriteSeriesList() -> [SeriesData] {
        storage.filter { $0.isFavourite == true }
    }
}

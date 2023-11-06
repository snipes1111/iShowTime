//
//  DataManager.swift
//  iShowTime
//
//  Created by user on 18/10/2023.
//

import Foundation
import RealmSwift

protocol DataStoreManagerProtocol {
    func save(seriesData: SeriesData, countries: String)
    func setIsFavourite(seriesData: SeriesData, countries: String)
    func seriesList() -> Results<SeriesData>
    func favouriteSeriesList() -> Results<SeriesData>
    func getSeries(with id: Double) -> SeriesData?
    func setSeriesProgress(seriesData: SeriesData, seriesProgress: SeriesProgress)
}

class DataStoreManger: DataStoreManagerProtocol {

    static let shared = DataStoreManger()
    let realm = try! Realm()

    func save(seriesData: SeriesData, countries: String) {
        try! realm.write {
            seriesData.isBeingWatched.toggle()
            seriesData.originCountry = countries
            realm.add(seriesData)
        }
        checkForDelete(seriesData: seriesData)
    }

    func setIsFavourite(seriesData: SeriesData, countries: String) {
        try! realm.write {
            seriesData.isFavourite.toggle()
            seriesData.originCountry = countries
            realm.add(seriesData)
        }
        checkForDelete(seriesData: seriesData)
    }

    func seriesList() -> Results<SeriesData> {
        realm.objects(SeriesData.self).where { $0.isBeingWatched == true }
    }

    func favouriteSeriesList() -> Results<SeriesData> {
        realm.objects(SeriesData.self).where { $0.isFavourite == true }
    }

    func getSeries(with id: Double) -> SeriesData? {
        realm.objects(SeriesData.self).first { $0.series.id == id }
    }

    func setSeriesProgress(seriesData: SeriesData, seriesProgress: SeriesProgress) {
        try! realm.write {
            seriesData.currentSeason = seriesProgress.season
            seriesData.currentEpisode = seriesProgress.episode
            seriesData.currentProgress = seriesProgress.progress
            realm.add(seriesData)
        }
    }

    private func checkForDelete(seriesData: SeriesData) {
        if !seriesData.isBeingWatched && !seriesData.isFavourite {
            try! realm.write {
                realm.delete(seriesData)
            }
        }
    }
}

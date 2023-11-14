//
//  DataManager.swift
//  iShowTime
//
//  Created by user on 18/10/2023.
//

import Foundation
import RealmSwift

protocol DataStoreManagerProtocol {
    func watchingSeriesList() -> Results<SeriesData>
    func favouriteSeriesList() -> Results<SeriesData>
    func getSeries(with id: Double) -> SeriesData?
    func setIsBeingWatched(seriesData: SeriesData, countries: String)
    func setIsFavourite(seriesData: SeriesData, countries: String)
    func setSeriesProgress(seriesData: SeriesData, seriesProgress: SeriesProgress)
    func checkForDelete()
}

class DataStoreManger: DataStoreManagerProtocol {

    private let realm = try! Realm()

    func setIsBeingWatched(seriesData: SeriesData, countries: String) {
        try! realm.write {
            seriesData.isBeingWatched.toggle()
            seriesData.originCountry = countries
            realm.add(seriesData)
        }
    }

    func setIsFavourite(seriesData: SeriesData, countries: String) {
        try! realm.write {
            seriesData.isFavourite.toggle()
            seriesData.originCountry = countries
            realm.add(seriesData)
        }
    }

    func watchingSeriesList() -> Results<SeriesData> {
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

    func checkForDelete() {
        let removingItems = realm.objects(SeriesData.self).filter { !$0.isFavourite && !$0.isBeingWatched }
        removingItems.forEach { item in
            try! realm.write {
                realm.delete(item)
            }
        }
    }
}

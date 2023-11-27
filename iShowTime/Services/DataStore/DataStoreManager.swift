//
//  DataStoreManager.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 18/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataStoreManagerProtocol {
    func watchingSeriesList() -> Results<SeriesData>
    func favouriteSeriesList() -> Results<SeriesData>
    func getSeries(with id: Double) -> SeriesData?
    func setIsBeingWatched(seriesData: SeriesData)
    func setIsFavourite(seriesData: SeriesData)
    func setSeriesProgress(seriesData: SeriesData, seriesProgress: SeriesProgress)
    func checkForDelete()
}

class DataStoreManger: DataStoreManagerProtocol {

    private let realm = try! Realm()
    private let imageCacheManager: CachedImageProtocol = ImageCachingManager.shared

    func setIsBeingWatched(seriesData: SeriesData) {
        try! realm.write {
            seriesData.isBeingWatched.toggle()
            setImageData(seriesData: seriesData)
            realm.add(seriesData)
        }
    }

    func setIsFavourite(seriesData: SeriesData) {
        try! realm.write {
            seriesData.isFavourite.toggle()
            setImageData(seriesData: seriesData)
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
        realm.objects(SeriesData.self).first { $0.series?.id == id }
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

    private func setImageData(seriesData: SeriesData) {
        guard seriesData.imageData == nil && seriesData.backDropImageData == nil
        else { return }
        let imagePath = seriesData.series?.posterPath ?? ""
        let backDropPath = seriesData.series?.backdropPath ?? ""
        seriesData.imageData = imageCacheManager.loadImageFromCache(imagePath)
        seriesData.backDropImageData = imageCacheManager.loadImageFromCache(backDropPath)
    }
}

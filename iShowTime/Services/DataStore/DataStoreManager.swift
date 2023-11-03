//
//  DataManager.swift
//  iShowTime
//
//  Created by user on 18/10/2023.
//

import Foundation
import RealmSwift

protocol DataStoreMangerProtocol {
    func save(seriesData: SeriesData)
    func remove(seriesData: SeriesData)
    func seriesList() -> Results<SeriesData>
    func favouriteSeriesList() -> Results<SeriesData>
}

class DataStoreManger: DataStoreMangerProtocol {

    static let shared = DataStoreManger()
    let realm = try! Realm()

    private var storage: [SeriesData] = []

    func save(seriesData: SeriesData) {
        guard !storage.contains(seriesData) else {
            remove(seriesData: seriesData)
            storage.append(seriesData)
            return
        }
        storage.append(seriesData)
        print("Successfully saved")

        try! realm.write {
            seriesData.isBeingWatched.toggle()
            realm.add(seriesData)
        }
    }

    func remove(seriesData: SeriesData) {
        guard let index = storage.firstIndex(of: seriesData) else { return }
        storage.remove(at: index)
        print("Successfully removed")
    }

    func seriesList() -> Results<SeriesData> {
        realm.objects(SeriesData.self).where { $0.isBeingWatched == true }
    }

    func favouriteSeriesList() -> Results<SeriesData> {
        realm.objects(SeriesData.self).where { $0.isFavourite == true }
    }
}

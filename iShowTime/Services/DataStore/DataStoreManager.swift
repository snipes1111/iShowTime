//
//  DataManager.swift
//  iShowTime
//
//  Created by user on 18/10/2023.
//

import Foundation

protocol DataStoreMangerProtocol {
    func save(series: Series)
    func remove(series: Series)
    func isSavedBefore(series: Series) -> Bool
    func seriesList() -> [Series]

    func saveToFavourites(series: Series)
    func removeFromFavourites(series: Series)
    func isFavourite(series: Series) -> Bool
    func favouriteSeriesList() -> [Series]
}

class DataStoreManger: DataStoreMangerProtocol {

    static let shared = DataStoreManger()
    private var storage: [Series] = []
    private var favouriteStorage: [Series] = []

    func save(series: Series) {
        guard !storage.contains(series) else { return }
        storage.append(series)
        print("Successfully saved")
    }

    func remove(series: Series) {
        guard let index = storage.firstIndex(of: series) else { return }
        storage.remove(at: index)
        print("Successfully removed")
    }

    func isSavedBefore(series: Series) -> Bool {
        storage.contains(series)
    }

    func seriesList() -> [Series] {
        storage
    }

    func saveToFavourites(series: Series) {
        guard !favouriteStorage.contains(series) else { return }
        favouriteStorage.append(series)
        print("Successfully saved to favourites")
    }

    func removeFromFavourites(series: Series) {
        guard let index = favouriteStorage.firstIndex(of: series) else { return }
        favouriteStorage.remove(at: index)
        print("Successfully removed from favourites")
    }

    func isFavourite(series: Series) -> Bool {
        favouriteStorage.contains(series)
    }

    func favouriteSeriesList() -> [Series] {
        favouriteStorage
    }
}

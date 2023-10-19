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
}

class DataStoreManger: DataStoreMangerProtocol {

    static let shared = DataStoreManger()
    private var storage: [Series] = []

    func isSavedBefore(series: Series) -> Bool {
        storage.contains(series)
    }

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

    func seriesList() -> [Series] {
        storage
    }
}

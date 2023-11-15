//
//  SeriesData.swift
//  iShowTime
//
//  Created by user on 03/11/2023.
//

import RealmSwift
import Foundation

final class SeriesData: Object {
    @Persisted var seriesObject: Data = Data()
    @Persisted var isFavourite: Bool = false
    @Persisted var isBeingWatched: Bool = false
    @Persisted var currentSeason: Double = 1
    @Persisted var currentEpisode: Double = 0
    @Persisted var currentProgress: Float = 0
    @Persisted var originCountry: String = ""

    var series: Series? {
        get {
            decodeSeriesObject()
        } set {
            guard let encodedSeries = encodeSeriesObject(series: newValue) else { return }
            seriesObject = encodedSeries
        }
    }

    convenience init(series: Series) {
        self.init()
        self.series = series
    }
}

extension SeriesData {
    private func encodeSeriesObject(series: Series?) -> Data? {
            do {
                return try JSONEncoder().encode(series)
            } catch {
                print("Error encoding series: \(error)")
                return nil
            }
        }

    private func decodeSeriesObject() -> Series? {
            do {
                return try JSONDecoder().decode(Series.self, from: seriesObject)
            } catch {
                print("Error decoding series: \(error)")
                return nil
            }
        }
}


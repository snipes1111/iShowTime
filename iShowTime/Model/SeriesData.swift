//
//  SeriesData.swift
//  iShowTime
//
//  Created by user on 03/11/2023.
//

import RealmSwift
import Foundation

final class SeriesData: Object {
    @Persisted var seriesObject: Data?
    @Persisted var isFavourite: Bool = false
    @Persisted var isBeingWatched: Bool = false
    @Persisted var currentSeason: Double = 1
    @Persisted var currentEpisode: Double = 0
    @Persisted var currentProgress: Float = 0
    @Persisted var originCountry: String = ""

    var series: Series {
        try! JSONDecoder().decode(Series.self, from: seriesObject!)
    }

    convenience init(series: Series) {
        self.init()
        seriesObject = try! JSONEncoder().encode(series)
    }
}

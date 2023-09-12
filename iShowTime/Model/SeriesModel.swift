//
//  SeriesModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation

struct SeriesModel {
    let name: String
    let numberOfSeasons: Int
    let numberOfSeries: Int
    let image: String
    let currentSeason: Int
    let currentEpisode: Int
}

extension SeriesModel {
    static func getCurrentEpisode() -> SeriesModel {
        return SeriesModel(name: "Title of series", numberOfSeasons: 5, numberOfSeries: 20, image: "film", currentSeason: 2, currentEpisode: 5)
    }
}

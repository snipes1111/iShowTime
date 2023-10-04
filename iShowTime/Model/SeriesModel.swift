//
//  SeriesModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation

struct SeriesModel: Codable {
    let name: String
    let numberOfSeasons: Int
    let numberOfSeries: Int
    let image: String
    let currentSeason: Int
    let currentEpisode: Int
}

extension SeriesModel {
    static func getCurrentEpisode() -> SeriesModel {
        return SeriesModel(name: "Title of series", numberOfSeasons: 5, numberOfSeries: 20,
                           image: "film", currentSeason: 2, currentEpisode: 5)
    }

    static func getSeries() -> [SeriesModel] {
        return [
            SeriesModel(name: "Lost", numberOfSeasons: 5, numberOfSeries: 20,
                        image: "film", currentSeason: 2, currentEpisode: 5),
            SeriesModel(name: "Game of the thrones", numberOfSeasons: 10, numberOfSeries: 15,
                        image: "film", currentSeason: 1, currentEpisode: 10),
            SeriesModel(name: "Sherlock", numberOfSeasons: 2, numberOfSeries: 32,
                        image: "film", currentSeason: 7, currentEpisode: 8)
        ]
    }
}

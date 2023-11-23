//
//  Series.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 12/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

struct Series: Codable {

    struct Genre: Codable {
        let name: String?
        let id: Double?
    }

    struct Season: Codable {
        let seasonNumber: Double?
        let episodeCount: Double?
    }

    struct Episode: Codable {
        let airDate: String
    }

    let id: Double?
    let backdropPath: String?
    let posterPath: String?
    let seasons: [Season]?
    let nextEpisodeToAir: Episode?
    let name: String?
    let genreIds: [Double]?
    let genres: [Genre]?
    let originCountry: [String]?
    let firstAirDate: String?
    let lastAirDate: String?
    let overview: String?
    let voteAverage: Double?
    let numberOfEpisodes: Double?
    let numberOfSeasons: Double?
    let inProduction: Bool?
}

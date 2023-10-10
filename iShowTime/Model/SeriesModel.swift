//
//  SeriesModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation

struct Page: Codable {
    let page: Double?
    let results: [Series]?
    let totalPages: Double?
    let totalResults: Double?
}

struct Series: Codable {
    let id: Double?
    let name: String?
    let originCountry: [String]?
    let firstAirDate: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let numberOfEpisodes: Double?
    let numberOfSeasons: Double?
    let genreIds: [Double]?
}

struct Country: Codable {
    let iso: String?
    let englishName: String?
    let nativeName: String?

    private enum CodingKeys: String, CodingKey {
        case englishName, nativeName
        case iso = "iso31661"
    }
}

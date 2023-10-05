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

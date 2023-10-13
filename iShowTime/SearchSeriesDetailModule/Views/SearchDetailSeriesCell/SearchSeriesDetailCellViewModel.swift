//
//  SearchSeriesDetailCellViewModel.swift
//  iShowTime
//
//  Created by user on 12/10/2023.
//

import Foundation

protocol SearchSeriesDetailCellViewModelProtocol {
    var seriesName: String { get }
    var seriesRating: String { get }
    var genreAndYear: String { get }
    var countryAndSeasonsCount: String { get }
    var overview: String { get }
    var imageUrl: String? { get }
    init(series: Series)
}

final class SearchSeriesDetailCellViewModel: SearchSeriesDetailCellViewModelProtocol {

    private var series: Series

    var seriesName: String { series.name ?? "Unknown name" }
    var seriesRating: String {
        guard let rating = series.voteAverage, rating != 0 else { return "No rating yet" }
        let roundedRating = String(format: "%.2f", rating)
        return "Rating MovieDB: \(roundedRating)"
    }
    var genreAndYear: String {
        let genre = receiveGenres()
        return "\(genre)"
    }
    var countryAndSeasonsCount: String {
        let countries = series.originCountry?.joined(separator: ", ")
        let seasonsCount = Int(series.numberOfSeasons ?? 1)
        let year = "\(series.firstAirDate?.extractYear() ?? "Unknown year")"
        return "\(countries ?? "Unknown countries"), seasons: \(seasonsCount) • \(year)"
    }
    var overview: String {
        series.overview ?? "No any overview yet"
    }
    var imageUrl: String? {
        series.posterPath
    }

    required init(series: Series) {
        self.series = series
    }

    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres else { return "Unknown genre" }
        return genreNames.joined(separator: ", ")
    }

}

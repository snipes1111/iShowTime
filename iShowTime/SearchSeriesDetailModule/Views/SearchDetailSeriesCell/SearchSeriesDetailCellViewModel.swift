//
//  SearchSeriesDetailCellViewModel.swift
//  iShowTime
//
//  Created by user on 12/10/2023.
//

import Foundation

enum ScoreRatingColor {
    case red
    case yellow
    case green
    case black
}

protocol SearchSeriesDetailCellViewModelProtocol {
    var seriesName: String { get }
    var seriesRatingIs: String { get }
    var seriesScoreRating: String { get }
    var scoreRatingColor: ScoreRatingColor { get }
    var genreAndYear: String { get }
    var countryAndSeasonsCount: String { get }
    var attributedOverviewText: String { get }
    var overview: String { get }
    var imageUrl: String? { get }
    var watchingNowButtonTitle: String { get }
    init(series: Series)
}

final class SearchSeriesDetailCellViewModel: SearchSeriesDetailCellViewModelProtocol {

    private var series: Series
    private var countryService: CountryService = CountryService.shared

    var seriesName: String { series.name ?? "Unknown name" }
    var seriesRatingIs: String {
        return "Rating MovieDB: "
    }
    var seriesScoreRating: String {
        guard let rating = series.voteAverage, rating != 0 else { return "No rating yet" }
        let roundedRating = String(format: "%.2f", rating)
        return roundedRating
    }
    var scoreRatingColor: ScoreRatingColor {
        returnRatingColor()
    }
    var genreAndYear: String {
        let genre = receiveGenres()
        return "\(genre)"
    }
    var countryAndSeasonsCount: String {
        let countries = countryService.getCountryNames(from: series)
        let seasonsCount = Int(series.numberOfSeasons ?? 1)
        let year = "\(series.firstAirDate?.extractYear() ?? "Unknown year")"
        return "\(countries), seasons: \(seasonsCount) • \(year)"
    }
    var attributedOverviewText: String {"   Overview: " }
    var overview: String {
        attributedOverviewText + (series.overview ?? "No any overview yet")
    }
    var imageUrl: String? {
        series.posterPath
    }
    var watchingNowButtonTitle: String {
        "Add to Watching Now"
    }

    required init(series: Series) {
        self.series = series
    }

    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres else { return "Unknown genre" }
        return genreNames.joined(separator: ", ")
    }

    private func returnRatingColor() -> ScoreRatingColor {
        guard let rating = series.voteAverage else { return .black }
        switch rating {
        case 0: return .black
        case 0..<5.5: return .red
        case 5.5..<7: return .yellow
        default: return .green
        }
    }
}

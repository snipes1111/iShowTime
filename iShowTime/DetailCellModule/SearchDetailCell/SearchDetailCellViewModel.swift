//
//  SearchDetailCellViewModel.swift
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

protocol SearchDetailCellViewModelProtocol: DetailCellViewModelProtocol {
    var ratingIs: String { get }
    var scoreRating: String { get }
    var scoreRatingColor: ScoreRatingColor { get }
    var genreAndYear: String { get }
    var countrySeasonsAndYear: String { get }
    var attributedOverviewText: String { get }
    var overview: String { get }
}

final class SearchDetailCellViewModel: DetailCellViewModel, SearchDetailCellViewModelProtocol {

    private var countryService: CountryService = CountryService.shared

    var ratingIs: String { SearchModuleConstants.ratingIs }
    var scoreRating: String { receiveRating() }
    var scoreRatingColor: ScoreRatingColor { returnRatingColor() }
    var genreAndYear: String { receiveGenres() }
    var countrySeasonsAndYear: String { receiveCountrySeasonAndYear() }
    var attributedOverviewText: String { SearchModuleConstants.overview }
    var overview: String { receiveOverview() }
}

extension SearchDetailCellViewModel {

    private func receiveOverview() -> String {
        guard let overview = series.overview, !overview.isEmpty
        else { return SearchModuleConstants.noOverview }
        return overview
    }

    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres
        else { return SearchModuleConstants.noGenre }
        return genreNames.joined(separator: ", ")
    }

    private func receiveCountrySeasonAndYear() -> String {
        let countries = countryService.getCountryNames(from: series)
        let seasonsCount = Int(series.numberOfSeasons ?? 1)
        let year = "\(series.firstAirDate?.extractYear() ?? SearchModuleConstants.noDate)"
        return "\(countries), \(SearchModuleConstants.seasons): \(seasonsCount) • \(year)"
    }

    private func receiveRating() -> String {
        guard let rating = series.voteAverage, rating != 0
        else { return SearchModuleConstants.noRating }
        let roundedRating = String(format: "%.2f", rating)
        return roundedRating
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
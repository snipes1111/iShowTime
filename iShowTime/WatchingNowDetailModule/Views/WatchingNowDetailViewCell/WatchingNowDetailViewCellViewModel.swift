//
//  WatchingNowDetailViewCellViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

protocol WatchingNowDetailViewCellViewModelProtocol {
    var seriesName: String { get }
    var ratingIs: String { get }
    var scoreRating: String { get }
    var scoreRatingColor: ScoreRatingColor { get }
    var genreAndYear: String { get }
    var countrySeasonsAndYear: String { get }
    var attributedOverviewText: String { get }
    var overview: String { get }
    var imageUrl: String? { get }
    var seriesIsSaved: Bool { get }
    init(series: Series)
    func watchingNowButtonPressed()
}

final class WatchingNowDetailViewCellViewModel: WatchingNowDetailViewCellViewModelProtocol {

    private var series: Series
    private var countryService: CountryService = CountryService.shared
    private var dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    var seriesName: String { series.name ?? SearchModuleConstants.unknownTitle }

    var ratingIs: String { SearchModuleConstants.ratingIs }

    var scoreRating: String { receiveRating() }

    var scoreRatingColor: ScoreRatingColor { returnRatingColor() }

    var genreAndYear: String { receiveGenres() }

    var countrySeasonsAndYear: String { receiveCountrySeasonAndYear() }

    var attributedOverviewText: String { SearchModuleConstants.overview }

    var overview: String { series.overview ?? SearchModuleConstants.noOverview  }

    var imageUrl: String? { series.posterPath }

    var seriesIsSaved: Bool { dataStoreManager.isSavedBefore(series: series) }

    required init(series: Series) {
        self.series = series
    }

    func watchingNowButtonPressed() {
        if !seriesIsSaved {
            dataStoreManager.save(series: series)
        } else {
            dataStoreManager.remove(series: series)
        }
    }
}

extension WatchingNowDetailViewCellViewModel {
    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres else { return "Unknown genre" }
        return genreNames.joined(separator: ", ")
    }

    private func receiveCountrySeasonAndYear() -> String {
        let countries = countryService.getCountryNames(from: series)
        let seasonsCount = Int(series.numberOfSeasons ?? 1)
        let year = "\(series.firstAirDate?.extractYear() ?? "Unknown year")"
        return "\(countries), seasons: \(seasonsCount) • \(year)"
    }

    private func receiveRating() -> String {
        guard let rating = series.voteAverage, rating != 0 else { return "No rating yet" }
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

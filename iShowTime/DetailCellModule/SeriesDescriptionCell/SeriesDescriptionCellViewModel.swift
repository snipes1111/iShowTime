//
//  SeriesDescriptionCellViewModel.swift
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

protocol SeriesDescriptionCellViewModelProtocol: DetailCellViewModelProtocol {
    var ratingIs: String { get }
    var scoreRating: String { get }
    var scoreRatingColor: ScoreRatingColor { get }
    var genreAndYear: String { get }
    var countrySeasonsAndYear: String { get }
    var attributedOverviewText: String { get }
    var overview: String { get }
    var seriesIsFavourite: Bool { get }
    func heartButtonDidTapped()
}

final class SeriesDescriptionCellViewModel: DetailCellViewModel, SeriesDescriptionCellViewModelProtocol {

    var ratingIs: String { Constants.SeriesInfo.rating }
    var scoreRating: String { receiveRating() }
    var scoreRatingColor: ScoreRatingColor { returnRatingColor() }
    var genreAndYear: String { receiveGenres() }
    var countrySeasonsAndYear: String { receiveCountrySeasonAndYear() }
    var attributedOverviewText: String { Constants.SeriesInfo.overview }
    var overview: String { receiveOverview() }
    var seriesIsFavourite: Bool { seriesData.isFavourite }
    func heartButtonDidTapped() { setIsFavourite() }
}

extension SeriesDescriptionCellViewModel {

    private func receiveOverview() -> String {
        guard let overview = series.overview, !overview.isEmpty
        else { return Constants.SeriesInfo.noOverview }
        return overview
    }

    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres
        else { return Constants.SeriesInfo.noGenre }
        return genreNames.joined(separator: ", ")
    }

    private func receiveCountrySeasonAndYear() -> String {
        let countries = countries + ", "
        let seasonsCount = "\(Int(series.numberOfSeasons ?? 1))"
        let year = series.firstAirDate?.extractYear() ?? Constants.SeriesInfo.noDate
        let divider = Constants.SeriesInfo.divider
        return countries + Constants.SeriesInfo.seasons + seasonsCount + divider + year
    }

    private func receiveRating() -> String {
        guard let rating = series.voteAverage, rating != 0
        else { return Constants.SeriesInfo.noRating }
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

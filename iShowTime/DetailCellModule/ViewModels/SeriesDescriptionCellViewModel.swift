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
    func showButtonDidTapped()
}

final class SeriesDescriptionCellViewModel: DetailCellViewModel, SeriesDescriptionCellViewModelProtocol {

    weak var delegate: CellResizable?

    var ratingIs: String { Constants.SeriesInfo.rating }

    var seriesIsFavourite: Bool { seriesData.isFavourite }

    var scoreRating: String {
        guard let rating = seriesData.series?.voteAverage, rating != 0
        else { return Constants.SeriesInfo.noRating }
        return String(format: "%.2f", rating)
    }

    var scoreRatingColor: ScoreRatingColor {
        guard let rating = seriesData.series?.voteAverage, rating != 0 else { return .black }
        switch rating {
        case 0...5.5: return .red
        case 5.5..<7: return .yellow
        default: return .green
        }
    }

    var genreAndYear: String {
        guard let genreNames = seriesData.series?.genres
        else { return Constants.SeriesInfo.noGenre }
        return genreNames.compactMap { $0.name }.joined(separator: ", ")
    }

    var countrySeasonsAndYear: String {
        let countries = seriesData.originCountry + " "
        let seasonsCount = "\(Int(seriesData.series?.numberOfSeasons ?? 1))"
        let year = seriesData.series?.firstAirDate?.extractYear() ?? Constants.SeriesInfo.noDate
        let divider = Constants.SeriesInfo.divider
        return countries + Constants.SeriesInfo.seasons + seasonsCount + divider + year
    }

    var attributedOverviewText: String { Constants.SeriesInfo.overview }
    
    var overview: String {
        guard let overview = seriesData.series?.overview, !overview.isEmpty
        else { return Constants.SeriesInfo.noOverview }
        return Constants.SeriesInfo.overview + overview
    }
    
    func heartButtonDidTapped() { setIsFavourite() }
    
    func showButtonDidTapped() {
        delegate?.resizeCell()
    }
}

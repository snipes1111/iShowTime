//
//  SeriesCellViewModel.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import Foundation

protocol SeriesCellViewModelProtocol {
    var seriesTitle: String { get }
    var secondaryLabelTitle: String { get }
    var tertiaryLabelTitle: String { get }
    var seasonsLabelIsHidden: Bool { get }
    var seasonsLabelText: String { get }
    var progressViewIsHidden: Bool { get }
    var imageUrl: String? { get }
    init(series: Series)
}

class SeriesCellViewModel: SeriesCellViewModelProtocol {

    private(set) var series: Series
    private var countryService: CountryService = CountryService.shared

    var seriesTitle: String {
        series.name ?? "Unknown"
    }

    var secondaryLabelTitle: String {
        let genres = series.genreIds
        return genres?.compactMap { $0.extractGenre() }.joined(separator: ", ") ?? "Unknown genres"
    }

    var tertiaryLabelTitle: String {
        let countryNames = countryService.getCountryNames(from: series)
        let year = " • \(series.firstAirDate?.extractYear() ?? "Unknown date")"
        return countryNames + year
    }

    var seasonsLabelIsHidden: Bool {
        true
    }

    var seasonsLabelText: String {
        let numberOfSeasons = Int(series.numberOfSeasons ?? 1)
        return "Seasons - \(numberOfSeasons)"
    }

    var progressViewIsHidden: Bool {
        true
    }

    var imageUrl: String? {
        series.posterPath
    }

    required init(series: Series) {
        self.series = series
    }
}

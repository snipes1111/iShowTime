//
//  SeriesCellViewModel.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import Foundation

protocol SeriesCellViewModelProtocol {
    var seriesTitle: String { get }
    var genreLabel: String { get }
    var countryAndYear: String { get }
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

    var genreLabel: String {
        let genres = series.genreIds
        return genres?.compactMap { $0.extractGenre() }.joined(separator: ", ") ?? "Unknown genres"
    }

    var countryAndYear: String {
        let countryNames = countryService.getCountryNames(from: series)
        let year = " • \(series.firstAirDate?.extractYear() ?? "Unknown date")"
        return countryNames + year
    }

    var seasonsLabelText: String {
        let status = series.inProduction ?? false
        return status ? SearchModuleConstants.inProduction : SearchModuleConstants.finished
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
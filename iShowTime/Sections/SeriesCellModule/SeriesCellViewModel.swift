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
    var seriesProgress: Float { get }
    var imageUrl: String? { get }
    init(cellSeriesData: SeriesData)
}

class SeriesCellViewModel: SeriesCellViewModelProtocol {

    let seriesData: SeriesData
    var series: Series

    var seriesTitle: String {
        series.name ?? "Unknown"
    }

    var genreLabel: String {
        let genres = series.genreIds
        return genres?.compactMap { $0.extractGenre() }.joined(separator: ", ") ?? "Unknown genres"
    }

    var countryAndYear: String {
        let year = " • \(series.firstAirDate?.extractYear() ?? "Unknown date")"
        return seriesData.originCountry + year
    }

    var seasonsLabelText: String {
        let status = series.inProduction ?? false
        return status ? SearchModuleConstants.inProduction : SearchModuleConstants.finished
    }

    var progressViewIsHidden: Bool {
        true
    }

    var seriesProgress: Float {
        seriesData.currentProgress
    }

    var imageUrl: String? {
        series.posterPath
    }

    required init(cellSeriesData: SeriesData) {
        seriesData = cellSeriesData
        series = cellSeriesData.series
    }
}

//
//  SearchSeriesCellViewModel.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import Foundation

protocol SeriesCellViewModelProtocol {
    var seriesTitle: String { get }
    var secondaryLabelTitle: String { get }
    var tertiaryLabelTitle: String { get }
    var progressViewIsVisible: Bool { get }
    var imageUrl: String { get }
}

class SearchSeriesCellViewModel: SeriesCellViewModelProtocol {

    private var series: Series

    var seriesTitle: String {
        series.name ?? "Unknown"
    }

    var secondaryLabelTitle: String {
        let genres = series.genreIds
        return genres?.compactMap { $0.extractGenre() }.joined(separator: ", ") ?? "Unknown genres"
    }

    var tertiaryLabelTitle: String {
        let countries = "\(series.originCountry?.joined(separator: ", ") ?? "Unknown")"
        let year = " • \(series.firstAirDate?.extractYear() ?? "Unknown")"
        return countries + year
    }

    var progressViewIsVisible: Bool {
        true
    }

    var imageUrl: String {
        series.posterPath ?? "Unknown path"
    }

    init(series: Series) {
        self.series = series
    }
}

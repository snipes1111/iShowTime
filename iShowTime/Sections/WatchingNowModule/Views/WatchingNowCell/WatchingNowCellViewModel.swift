//
//  WatchingNowCellViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

protocol WatchingNowCellViewModelProtocol {
    var seriesTitle: String { get }
    var secondaryLabelTitle: String { get }
    var tertiaryLabelTitle: String { get }
    var seasonsLabelText: String { get }
    var progressViewIsHidden: Bool { get }
    var imageUrl: String? { get }
    init(series: Series)
}

class WatchingNowCellViewModel: WatchingNowCellViewModelProtocol {
    private var series: Series
    private var countryService: CountryService = CountryService.shared

    var seriesTitle: String {
        series.name ?? "Unknown"
    }

    var secondaryLabelTitle: String {
        receiveGenres()
    }

    var tertiaryLabelTitle: String {
        let countryNames = countryService.getCountryNames(from: series)
        let year = " • \(series.firstAirDate?.extractYear() ?? "Unknown date")"
        return countryNames + year
    }

    var seasonsLabelText: String {
        let numberOfSeasons = Int(series.numberOfSeasons ?? 1)
        return "Seasons - \(numberOfSeasons)"
    }

    var progressViewIsHidden: Bool {
        false
    }

    var imageUrl: String? {
        series.posterPath
    }

    required init(series: Series) {
        self.series = series
    }
}

extension WatchingNowCellViewModel {
    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres else { return "Unknown genre" }
        return genreNames.joined(separator: ", ")
    }
}

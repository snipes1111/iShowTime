//
//  SeriesCellViewModel.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import Foundation

protocol SeriesCellViewModelProtocol {
    var title: String { get }
    var countryAndYear: String { get }
    var productionStatus: String { get }
    var seasonsCount: String { get }
    var progressIsHidden: Bool { get }
    var progress: Float { get }
    var imageUrl: String? { get }
    init(cellSeriesData: SeriesData)
}

class SeriesCellViewModel: SeriesCellViewModelProtocol {

    let seriesData: SeriesData

    var title: String { seriesData.series?.name ?? Constants.SeriesInfo.unknownTitle }

    var countryAndYear: String {
        let year = seriesData.series?.firstAirDate?.extractYear() ?? Constants.SeriesInfo.noDate
        return seriesData.originCountry + Constants.SeriesInfo.divider + year
    }

    var productionStatus: String {
        let status = seriesData.series?.inProduction ?? false
        return status ? Constants.SeriesInfo.inProduction : Constants.SeriesInfo.finished
    }

    var seasonsCount: String {
        let seasons = "\(Int(seriesData.series?.numberOfSeasons ?? 1))"
        return Constants.SeriesInfo.seasons + seasons
    }

    var progressIsHidden: Bool { !seriesData.isBeingWatched }

    var progress: Float { seriesData.currentProgress }

    var imageUrl: String? { seriesData.series?.posterPath }

    required init(cellSeriesData: SeriesData) {
        seriesData = cellSeriesData
    }
}

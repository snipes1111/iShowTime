//
//  SeriesCellViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 27/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

protocol SeriesCellViewModelProtocol: AnyObject {
    var title: String { get }
    var countryAndYear: String { get }
    var productionStatus: String { get }
    var seasonsCount: String { get }
    var progressIsHidden: Bool { get }
    var progress: Float { get }
    var imageUrl: String? { get }
    var imageData: Data? { get }
    init(cellSeriesData: SeriesData)
}

final class SeriesCellViewModel: SeriesCellViewModelProtocol {

    let seriesData: SeriesData

    var title: String { seriesData.series?.name ?? SeriesConstants.unknownTitle }

    var countryAndYear: String {
        let year = seriesData.series?.firstAirDate?.extractYear() ?? SeriesConstants.noDate
        return seriesData.originCountry + SeriesConstants.divider + year
    }

    var productionStatus: String {
        let status = seriesData.series?.inProduction ?? false
        return status ? SeriesConstants.inProduction : SeriesConstants.finished
    }

    var seasonsCount: String {
        let seasons = "\(Int(seriesData.series?.numberOfSeasons ?? 1))"
        return SeriesConstants.seasons + seasons
    }

    var progressIsHidden: Bool { !seriesData.isBeingWatched }

    var progress: Float { seriesData.currentProgress }

    var imageUrl: String? { seriesData.series?.posterPath }

    var imageData: Data? { seriesData.imageData }

    required init(cellSeriesData: SeriesData) {
        seriesData = cellSeriesData
    }
}

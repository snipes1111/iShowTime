//
//  SeriesFetcher.swift
//  iShowTime
//
//  Created by user on 17/11/2023.
//

import Foundation

protocol SeriesFetcherProtocol {
    func fetchAndDecodeData(_ searchText: String) async -> [SeriesData]
}

class SeriesFetcher: SeriesFetcherProtocol {
    private let networkService: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()
    private let countryService = CountryService()

    func fetchAndDecodeData(_ searchText: String) async -> [SeriesData] {
        let series = await fetchSeriesData(searchText)
        await fetchCountries()
        series.forEach { $0.originCountry = countryService.getCountryNames(from: $0) }
        return series
    }

    private func fetchSeriesData(_ searchText: String) async -> [SeriesData] {
        guard let seriesJSON = await networkService.fetchSeriesData(searchText),
              let series = decoder.decodeSeriesFromData(seriesJSON) else { return [] }
        let seriesIds = series.compactMap { $0.id }
        let detailedSeries = await fetchSeriesDetails(seriesIds)
        return detailedSeries.map { SeriesData(series: $0) }
    }

    private func fetchCountries() async {
        guard let countriesData = await networkService.fetchCountryList(),
              let countries = decoder.decodeCountryList(countriesData) else { return }
        countryService.updateCountryList(with: countries)
    }

    private func fetchSeriesDetails(_ seriesIds: [Double]) async -> [Series] {
        var results: [Series] = []
        for id in seriesIds {
            guard let data = await networkService.fetchSeriesDetails(id),
                  let result = decoder.decodeSeriesDetailsFromData(data) else { continue }
            results.append(result)
        }
        return results
    }
}

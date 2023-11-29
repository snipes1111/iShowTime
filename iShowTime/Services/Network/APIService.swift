//
//  APIService.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 04/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

final class APIService {

    enum RequestType: String {
        case searchSeries = "/search/tv"
        case countryList = "/configuration/countries"
        case seriesDetails = "/tv"
    }

    private let mainUrl = "https://api.themoviedb.org/3"
    private let apiKey = PlistManager.getValue(from: "Bearer") ?? ""
    private let accept = "application/json"

    private var header: [String: String] {
        ["accept": accept,
         "Authorization": apiKey]
    }

    func buildSearchUrlRequest(with searchText: String) -> URLRequest? {
        guard let url = buildUrl(for: .searchSeries, and: "query", equals: searchText) else { return nil }
        return buildUrlRequest(url)
    }

    func buildCountryListUrlRequest() -> URLRequest? {
        guard let url = buildUrl(for: .countryList, and: "language", equals: "en-US") else { return nil }
        return buildUrlRequest(url)
    }

    func buildSeriesDetailsRequest(_ seriesId: Double) -> URLRequest? {
        guard let url = buildUrl(for: .seriesDetails, with: seriesId,
                                 and: "language", equals: "en-US") else { return nil }
        return buildUrlRequest(url)
    }

    func buildImageUrl(_ imagePath: String) -> URL? {
        let baseUrlString = "https://image.tmdb.org/t/p/w300\(imagePath)"
        return URL(string: baseUrlString)
    }

    private func buildUrlRequest(_ url: URL) -> URLRequest? {
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        return request
    }

    private func buildUrl(for request: RequestType, with seriesId: Double? = nil,
                          and query: String, equals value: String) -> URL? {
        var urlComponents = URLComponents(string: mainUrl)
        urlComponents?.path += request.rawValue
        if let seriesId = seriesId { urlComponents?.path += "/\(seriesId)" }
        let queryItem = URLQueryItem(name: query, value: value)
        urlComponents?.queryItems = [queryItem]
        return urlComponents?.url
    }

}

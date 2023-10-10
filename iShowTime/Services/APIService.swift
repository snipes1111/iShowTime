//
//  APIService.swift
//  iShowTime
//
//  Created by user on 04/10/2023.
//

import Foundation

class APIService {

    enum RequestType {
        case searchSeries
        case countryList
    }

    private let mainUrl = "https://api.themoviedb.org/3"
    private let searchPath = "/search/tv"
    private let countryListPath = "/configuration/countries"
    private let apiKey = PlistManager.getValue(from: "Bearer") ?? ""
    private let accept = "application/json"

    private var header: [String: String] {
        ["accept": accept,
        "Authorization": apiKey]
    }

    func buildSearchUrlRequest(with searchText: String) -> URLRequest? {
        guard let url = buildUrl(with: "query", equals: searchText, for: .searchSeries) else { return nil }
        return buildUrlRequest(url)
    }

    func buildCountryListUrlRequest() -> URLRequest? {
        guard let url = buildUrl(with: "language", equals: "en-US", for: .countryList) else { return nil }
        return buildUrlRequest(url)
    }

    func buildImageUrl(_ imagePath: String) -> URL? {
        let baseUrlString = "https://image.tmdb.org/t/p/w500\(imagePath)"
        return URL(string: baseUrlString)
    }

    private func buildUrlRequest(_ url: URL) -> URLRequest? {
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        return request
    }

    private func buildUrl(with query: String, equals to: String, for request: RequestType) -> URL? {
        var urlComponents = URLComponents(string: mainUrl)
        let pathModifier = request == .searchSeries ? searchPath : countryListPath
        urlComponents?.path += pathModifier
        let queryItem = URLQueryItem(name: query, value: to)
        urlComponents?.queryItems = [queryItem]
        return urlComponents?.url
    }
}

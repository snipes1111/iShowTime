//
//  APIService.swift
//  iShowTime
//
//  Created by user on 04/10/2023.
//

import Foundation

class APIService {

    private let mainUrl = "https://api.themoviedb.org/3/search/tv"
    private let apiKey = PlistManager.getValue(from: "Bearer") ?? ""
    private let accept = "application/json"

    private var header: [String: String] {
        ["accept": accept,
        "Authorization": apiKey]
    }

    func buildUrlRequest(with searchText: String) -> URLRequest? {
        guard let url = buildUrl(searchText) else { return nil }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        return request
    }

    private func buildUrl(_ searchText: String) -> URL? {
        var urlComponents = URLComponents(string: mainUrl)
        let queryItem = URLQueryItem(name: "query", value: searchText)
        urlComponents?.queryItems = [queryItem]
        return urlComponents?.url
    }

    func buildImageUrl(_ imagePath: String) -> URL? {
        let baseUrlString = "https://image.tmdb.org/t/p/w500\(imagePath)"
        return URL(string: baseUrlString)
    }

}

//
//  NetworkService.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchSeriesData(_ searchText: String) async -> Data?
    func fetchCountryList() async -> Data?
    func fetchSeriesDetails(_ seriesId: Double) async -> Data?
    func fetchImageData(with url: URL) async -> Data?
}

final class NetworkService: NetworkServiceProtocol {
    enum NetworkErrors: Error {
        case badResponse
        case invalidUrl
    }

    private let apiService = APIService()
    private let errorHandler = ErrorHandler()

    func fetchSeriesData(_ searchText: String) async -> Data? {
        await fetchDataWithErrorHandler(apiService.buildSearchUrlRequest(with: searchText))
    }

    func fetchCountryList() async -> Data? {
        await fetchDataWithErrorHandler(apiService.buildCountryListUrlRequest())
    }

    func fetchSeriesDetails(_ seriesId: Double) async -> Data? {
        await fetchDataWithErrorHandler(apiService.buildSeriesDetailsRequest(seriesId))
    }

    func fetchImageData(with url: URL) async -> Data? {
        await fetchDataWithErrorHandler(URLRequest(url: url))
    }

    private func fetchData(with urlRequest: URLRequest?) async throws -> Data {
        guard let urlRequest = urlRequest else { throw NetworkErrors.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return data
        } catch {
            throw NetworkErrors.badResponse
        }
    }

    private func fetchDataWithErrorHandler(_ urlRequest: URLRequest?) async -> Data? {
        do {
            let data = try await fetchData(with: urlRequest)
            return data
        } catch {
            errorHandler.handle(error)
            return nil
        }
    }
}

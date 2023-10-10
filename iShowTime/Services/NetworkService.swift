//
//  NetworkService.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchSeriesData(_ searchText: String) async throws -> Data
    func fetchCountryList() async throws -> Data
}

final class NetworkService: NetworkServiceProtocol {
    enum NetworkErrors: Error {
        case badResponse
        case invalidUrl
    }

    private let apiService = APIService()

    func fetchSeriesData(_ searchText: String) async throws -> Data {
        guard let urlRequest = apiService.buildSearchUrlRequest(with: searchText)
        else { throw NetworkErrors.invalidUrl }
        let data = try await fetchData(with: urlRequest)
        return data
    }

    func fetchCountryList() async throws -> Data {
        guard let urlRequest = apiService.buildCountryListUrlRequest()
        else { throw NetworkErrors.invalidUrl }
        let data = try await fetchData(with: urlRequest)
        return data
    }

    private func fetchData(with urlRequest: URLRequest) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return data
        } catch {
            throw NetworkErrors.badResponse
        }
    }
}

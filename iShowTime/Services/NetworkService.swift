//
//  NetworkService.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchSeriesData(_ urlString: String) async throws -> Data
}

final class NetworkService: NetworkServiceProtocol {
    enum NetworkErrors: Error {
        case badResponse
        case invalidUrl
    }

    private let apiService = APIService()

    func fetchSeriesData(_ urlString: String) async throws -> Data {
        guard let urlRequest = apiService.buildUrlRequest(with: urlString) else { throw NetworkErrors.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return data
        } catch {
            throw NetworkErrors.badResponse
        }
    }
}

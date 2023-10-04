//
//  NetworkService.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchSeries(with name: String) -> [SeriesModel]
}

final class NetworkService {
    enum NetworkErrors: Error {
        case badResponse
        case invalidUrl
    }

    private init() {}

    private func fetchSeriesData(_ urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else { throw NetworkErrors.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkErrors.badResponse
        }
    }
}

//
//  SeriesDecoder.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol SeriesDecoderProtocol {
    func decodeSeriesFromData(_ data: Data) -> [Series]?
    func decodeCountryList(_ data: Data) -> [Country]?
}

class SeriesDecoder: JSONDecoder, SeriesDecoderProtocol {

    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }

    func decodeSeriesFromData(_ data: Data) -> [Series]? {
        if let page: Page = decode(data) {
            return page.results
        }
        return nil
    }

    func decodeCountryList(_ data: Data) -> [Country]? {
        if let countries: [Country] = decode(data) {
            return countries
        }
        return nil
    }



    private func decode<T: Codable>(_ data: Data) -> T? {
        do {
            let json = try decode(T.self, from: data)
            return json
        } catch {
            print("Error to fetch json: \(error)")
        }
        return nil
    }
}

//
//  SeriesDecoder.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol SeriesDecoderProtocol {
    func decodeSeriesFromData(_ data: Data) -> [Series]?
    func decodeSeriesDetailsFromData(_ data: Data) -> Series?
    func decodeCountryList(_ data: Data) -> [Country]?
}

final class SeriesDecoder: JSONDecoder, SeriesDecoderProtocol {

    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }

    func decodeSeriesFromData(_ data: Data) -> [Series]? {
        let page: Page? = decode(data)
        return page?.results
    }

    func decodeSeriesDetailsFromData(_ data: Data) -> Series? {
        decode(data)
    }

    func decodeCountryList(_ data: Data) -> [Country]? {
         decode(data)
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

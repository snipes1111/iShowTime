//
//  SeriesDecoder.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol SeriesDecoderProtocol {
    func decodeSeriesFromData(_ data: Data) -> [Series]?
}

class SeriesDecoder: JSONDecoder, SeriesDecoderProtocol {

    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }

    func decodeSeriesFromData(_ data: Data) -> [Series]? {
        do {
            let page = try decode(Page.self, from: data)
            let series = page.results
            return series
        } catch {
            print("Error to fetch json: \(error)")
        }
        return nil
    }
}

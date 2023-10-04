//
//  SeriesDecoder.swift
//  iShowTime
//
//  Created by user on 28/09/2023.
//

import Foundation

protocol SeriesDecoderProtocol {
    func decodeSeriesFromData(_ data: Data) -> [SeriesModel]
}

class SeriesDecoder: JSONDecoder, SeriesDecoderProtocol {
    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }

    func decodeSeriesFromData(_ data: Data) -> [SeriesModel] {
        guard let series = try? decode([SeriesModel].self, from: data) else { return [] }
        return series
    }
}

//
//  CountryService.swift
//  iShowTime
//
//  Created by user on 16/10/2023.
//

import Foundation

class CountryService {
    static let shared = CountryService()
    private let dataStore: DataStoreManagerProtocol = DataStoreManger.shared
    private var countryList: [Country] = []

    private init() {}

    func updateCountryList(with countryList: [Country]) {
        self.countryList = countryList
    }

    func getCountryNames(from seriesData: SeriesData) -> String {
        guard let encodedISO = seriesData.series.originCountry, !encodedISO.isEmpty else { return "Unknown country" }
        let filteredCountryList = countryList.filter { encodedISO.contains($0.iso ?? "") }
        let countries = filteredCountryList.compactMap { $0.nativeName }.joined(separator: ", ")
        return countries
    }
}

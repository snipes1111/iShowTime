//
//  CountryService.swift
//  iShowTime
//
//  Created by user on 16/10/2023.
//

import Foundation

class CountryService {
    static let shared = CountryService()

    private var countryList: [Country] = []

    private init() {}

    func updateCountryList(with countryList: [Country]) {
        self.countryList = countryList
    }

    func getCountryNames(from series: Series) -> String {
        guard let encodedISO = series.originCountry, !encodedISO.isEmpty else { return "Unknown country" }
        let filteredCountryList = countryList.filter { encodedISO.contains($0.iso ?? "") }
        return filteredCountryList.compactMap { $0.nativeName }.joined(separator: ", ")
    }
}

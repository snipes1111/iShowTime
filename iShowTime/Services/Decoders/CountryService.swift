//
//  CountryService.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 16/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

class CountryService {

    private var countryList = [String?: String]()

    func updateCountryList(with countryList: [Country]) {
        let dictionary = countryList.reduce(into: [String: String]()) { result, country in
            result[country.iso] = country.nativeName
        }
        self.countryList = dictionary
    }

    func getCountryNames(from seriesData: SeriesData) -> String {
        guard let encodedISO = seriesData.series?.originCountry, !encodedISO.isEmpty
        else { return Constants.Labels.unknownCountry }
        return encodedISO.compactMap { countryList[$0] }.joined(separator: ", ")
    }
}

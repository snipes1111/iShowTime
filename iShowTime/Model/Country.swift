//
//  Country.swift
//  iShowTime
//
//  Created by user on 12/10/2023.
//

import Foundation

struct Country: Codable {
    let iso: String?
    let englishName: String?
    let nativeName: String?

    private enum CodingKeys: String, CodingKey {
        case englishName, nativeName
        case iso = "iso31661"
    }
}

//
//  Country.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 12/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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

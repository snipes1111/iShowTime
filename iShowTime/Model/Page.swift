//
//  Page.swift
//  iShowTime
//
//  Created by user on 12/10/2023.
//

import Foundation

struct Page: Codable {
    let page: Double?
    let results: [Series]?
    let totalPages: Double?
    let totalResults: Double?
}

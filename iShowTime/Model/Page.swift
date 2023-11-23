//
//  Page.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 12/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

struct Page: Codable {
    let page: Double?
    let results: [Series]?
    let totalPages: Double?
    let totalResults: Double?
}

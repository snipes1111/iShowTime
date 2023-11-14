//
//  Int+Extensions.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import Foundation

extension Double {
    func extractGenre() -> String? {
        Genres.findGenre(with: self)
    }
}

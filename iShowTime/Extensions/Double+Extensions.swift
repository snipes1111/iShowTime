//
//  Int+Extensions.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import Foundation

extension Double {

    private var genreDict: [Double: String] {
        [10759: "Action & Adventure",
         16: "Animation",
         35: "Comedy",
         80: "Crime",
         99: "Documentary",
         18: "Drama",
         10751: "Family",
         10762: "Kids",
         9648: "Mystery",
         10763: "News",
         10764: "Reality",
         10765: "Sci-Fi & Fantasy",
         10766: "Soap",
         10767: "Talk",
         10768: "War & Politics",
         37: "Western"]
    }

    func extractGenre() -> String {
        return genreDict[self] ?? "Unknown genre"
    }
}

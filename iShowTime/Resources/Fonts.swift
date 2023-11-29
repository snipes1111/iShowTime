//
//  Fonts.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 08/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

struct Fonts {
    static let tabItemTextAttributes = [NSAttributedString.Key.font:
                                        UIFont.systemFont(ofSize: 14, weight: .semibold)]
    static let showMoreButton: UIFont = .systemFont(ofSize: 16, weight: .bold)
    static let promptLabel: UIFont = .systemFont(ofSize: 24, weight: .medium)
    static let seriesName: UIFont = .boldSystemFont(ofSize: 18)
    static let seriesInfo: UIFont  = .systemFont(ofSize: 16)
    static let seriesButton: UIFont = .systemFont(ofSize: 16, weight: .semibold)

    struct DetailCell {
        static let seriesName: UIFont = .boldSystemFont(ofSize: 26)
        static let seriesRating: UIFont = .systemFont(ofSize: 20, weight: .semibold)
        static let seriesRatingScore: UIFont = .boldSystemFont(ofSize: 22)
        static let seriesInfo: UIFont = .systemFont(ofSize: 20, weight: .light)
        static let seasonAndEpisode: UIFont = .systemFont(ofSize: 18)
        static let overviewTextAttributes = [NSAttributedString.Key.font:
                                             UIFont.systemFont(ofSize: 18)]
        static let overviewAttributes = [NSAttributedString.Key.font:
                                         UIFont.systemFont(ofSize: 18, weight: .bold)]
    }
}

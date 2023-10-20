//
//  Fonts.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

struct Fonts {
    static let tabItemTextAttributes = [NSAttributedString.Key.font:
                                        UIFont.systemFont(ofSize: 14, weight: .semibold)]
    struct SearchModule {

        static let promptLabelFont: UIFont = .systemFont(ofSize: 24, weight: .semibold)
        static let titleFont: UIFont = .boldSystemFont(ofSize: 18)
        static let secondaryLabel: UIFont  = .systemFont(ofSize: 16)
    }

    struct SearchDetailModule {
        static let seriesNameLabel: UIFont = .boldSystemFont(ofSize: 26)
        static let seriesRatingIsLabel: UIFont = .systemFont(ofSize: 20, weight: .semibold)
        static let seriesRatingScoreLabel: UIFont = .systemFont(ofSize: 20, weight: .bold)
        static let genreLabel: UIFont = .systemFont(ofSize: 20, weight: .light)
        static let countrySeasonsAndYearLabel: UIFont = .systemFont(ofSize: 20, weight: .light)
        static let overviewLabel: UIFont = .systemFont(ofSize: 18)
        static let overviewTextAttributes = [NSAttributedString.Key.font:
                                                    UIFont.systemFont(ofSize: 18)]
        static let overviewAttributes = [NSAttributedString.Key.font:
                                                    UIFont.systemFont(ofSize: 18, weight: .bold)]
        static let watchingNowButton: UIFont = .systemFont(ofSize: 16, weight: .semibold)
    }

    struct WatchingNowModule {
        static let description: UIFont = .systemFont(ofSize: 20, weight: .light)
        static let seasonAndEpisode: UIFont = .systemFont(ofSize: 18)
    }
}

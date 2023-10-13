//
//  Fonts.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

struct Fonts {
    static let tabItemTextAttributes = [NSAttributedString.Key.font:
                                            UIFont.systemFont(ofSize: 16, weight: .semibold)]
    static let searchModulePromptLabelFont: UIFont = .systemFont(ofSize: 24, weight: .semibold)
    static let searchModuleSeriesTitleFont: UIFont = .boldSystemFont(ofSize: 18)
    static let searchModuleSecondaryLabel: UIFont  = .systemFont(ofSize: 16)
    static let searchDetailModuleSeriesNameLabel: UIFont = .boldSystemFont(ofSize: 26)
    static let searchDetailModuleSeriesRatingLabel: UIFont = .systemFont(ofSize: 20, weight: .semibold)
    static let searchDetailModuleGenreLabel: UIFont = .systemFont(ofSize: 20, weight: .light)
    static let searchDetailModuleCountrySeasonsAndYearLabel: UIFont = .systemFont(ofSize: 20, weight: .light)
}

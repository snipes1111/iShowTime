//
//  Images.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

struct Images {

    enum TabItemImages: String {
        case search = "magnifyingglass.circle"
    }

    static func imageForTabItem(_ image: TabItemImages) -> UIImage? {
        switch image {
        case .search:
            let configuration = UIImage.SymbolConfiguration(pointSize: 32, weight: .semibold)
            return UIImage(systemName: TabItemImages.search.rawValue,
                           withConfiguration: configuration)
        }
    }
}

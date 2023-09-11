//
//  UIImage+Extensions.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

extension UIImage {

    enum TabItemImages: String {
        case search = "magnifyingglass"
        case watchingNow = "popcorn"
    }

    static func designedImage(_ systemName: TabItemImages, _ size: CGFloat) -> UIImage? {
        let configuration = UIImage.SymbolConfiguration(pointSize: size, weight: .semibold)
        return UIImage(systemName: systemName.rawValue, withConfiguration: configuration)
    }
}

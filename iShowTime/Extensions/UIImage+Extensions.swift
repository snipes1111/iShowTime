//
//  UIImage+Extensions.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

extension UIImage {
    static func designedImage(_ systemName: String, _ size: CGFloat) -> UIImage? {
        let configuration = UIImage.SymbolConfiguration(pointSize: size, weight: .semibold)
        return UIImage(systemName: systemName, withConfiguration: configuration)
    }
}

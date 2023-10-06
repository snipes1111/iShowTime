//
//  UILabel+Extensions.swift
//  iShowTime
//
//  Created by user on 21/09/2023.
//

import UIKit

extension UILabel {
    convenience init (with font: UIFont, and color: UIColor = .black) {
        self.init(frame: .zero)
        self.font = font
        numberOfLines = 0
        textColor = color
    }
}

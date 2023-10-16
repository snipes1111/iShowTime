//
//  UILabel+Extensions.swift
//  iShowTime
//
//  Created by user on 21/09/2023.
//

import UIKit

extension UILabel {
    convenience init (font: UIFont, numberOfLines: Int = 0, color: UIColor = .black) {
        self.init()
        self.font = font
        self.numberOfLines = numberOfLines
        textColor = color
    }
}

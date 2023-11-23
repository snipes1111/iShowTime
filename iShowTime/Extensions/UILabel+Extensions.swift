//
//  UILabel+Extensions.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 21/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init (font: UIFont, numberOfLines: Int = 0, color: UIColor = .black, text: String? = nil) {
        self.init()
        self.font = font
        self.numberOfLines = numberOfLines
        textColor = color
        self.text = text
    }

    func addTextAttributes(for str: String?) {
        guard let labelText = self.text,
        let str = str else { return }
        let textRange = (str as NSString).range(of: str)
        let attributedString = NSMutableAttributedString(string: labelText,
                                                         attributes: Fonts.DetailCell.overviewTextAttributes)
        attributedString.setAttributes(Fonts.DetailCell.overviewAttributes, range: textRange)
        attributedText = attributedString
    }
}

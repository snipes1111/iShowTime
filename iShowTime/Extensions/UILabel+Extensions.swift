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

    func addTextAttributes(for str: String?) {
        guard let labelText = self.text,
        let str = str else { return }
        let textRange = (str as NSString).range(of: str)
        let attributedString = NSMutableAttributedString(string: labelText,
                                                         attributes: Fonts.SearchDetailModule.overviewTextAttributes)
        attributedString.setAttributes(Fonts.SearchDetailModule.overviewAttributes, range: textRange)
        attributedText = attributedString
    }
}
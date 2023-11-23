//
//  String+Extensions.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 05/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation
import UIKit

extension String {

    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }

    private var calendar: Calendar {
        Calendar.current
    }

    func extractYear() -> String? {
        guard let date = dateFormatter.date(from: self) else { return nil }
        let year = calendar.component(.year, from: date)
        return "\(year)"
    }

    func extractDate() -> String? {
        guard let date = dateFormatter.date(from: self) else { return nil }
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        guard let day = components.day, let month = components.month, let year = components.year
        else { return nil }
        return "\(day).\(month).\(year)"
    }

    func estimatedLabelHeight(width: CGFloat, font: UIFont, attributedText: String? = nil) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        if let attributedText = attributedText {
            label.addTextAttributes(for: attributedText)
        }
        label.sizeToFit()
        return label.frame.height
     }
}

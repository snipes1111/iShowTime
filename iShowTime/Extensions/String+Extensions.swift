//
//  String+Extensions.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import Foundation

extension String {
    func extractYear() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            return "\(year)"
        }
        return nil
    }

    func extractDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day, .month, .year], from: date)
            guard let day = components.day, let month = components.month, let year = components.year
            else { return nil }
            return "\(day).\(month).\(year)"
        }
        return nil
    }
}

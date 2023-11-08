//
//  UIStackView+Extensions.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subViews: [UIView?]) {
        subViews.forEach { subview in
            guard let subview = subview else { return }
            addArrangedSubview(subview)
        }
    }
}

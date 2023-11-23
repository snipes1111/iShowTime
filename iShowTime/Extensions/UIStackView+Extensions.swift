//
//  UIStackView+Extensions.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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

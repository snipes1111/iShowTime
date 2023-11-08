//
//  UIAction+Extensions.swift
//  iShowTime
//
//  Created by user on 08/11/2023.
//

import UIKit

    extension UIAction {
        convenience init(_ selector: @escaping () -> Void) {
            self.init { _ in
                selector()
            }
        }
    }

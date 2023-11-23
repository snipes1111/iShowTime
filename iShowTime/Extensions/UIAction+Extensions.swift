//
//  UIAction+Extensions.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 08/11/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

    extension UIAction {
        convenience init(_ selector: @escaping () -> Void) {
            self.init { _ in
                selector()
            }
        }
    }

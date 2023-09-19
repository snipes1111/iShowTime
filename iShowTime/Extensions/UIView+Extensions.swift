//
//  CustomAnimation.swift
//  iShowTime
//
//  Created by user on 19/09/2023.
//

import UIKit

extension UIView {
    func addSpringAnimation(_ duration: Double) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            self.transform = .identity
        }
    }
}

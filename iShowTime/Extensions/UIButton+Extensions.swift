//
//  UIButton+Extensions.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import UIKit

extension UIButton {
    func performTapAnimation() {
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) { [unowned self] in
            transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }
        animator.addAnimations({ [unowned self] in
            transform = .identity
        }, delayFactor: 0.15)
        animator.startAnimation()
    }
}

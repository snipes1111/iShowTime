//
//  CountButton.swift
//  iShowTime
//
//  Created by user on 20/10/2023.
//

import UIKit

class CountButton: UIButton {
    enum ButtonType: String {
        case plus = "plus.circle"
        case minus = "minus.circle"
    }
    convenience init(type: ButtonType) {
        self.init(type: .custom)
        let image = UIImage(systemName: type.rawValue)
        tintColor = .black.withAlphaComponent(0.7)
        setBackgroundImage(image, for: .normal)
        setSize(30, 30)
        addTarget(nil, action: #selector(addTapAnimation), for: .touchUpInside)
    }

    @objc func addTapAnimation() {
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
            self.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }

        animator.addAnimations({
            self.transform = .identity
        }, delayFactor: 0.15)

        animator.startAnimation()
    }
}

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
        addTarget(self, action: #selector(tapWithAnimation), for: .touchUpInside)
    }

    @objc func tapWithAnimation() {
        performTapAnimation()
    }
}

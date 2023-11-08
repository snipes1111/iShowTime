//
//  CountButton.swift
//  iShowTime
//
//  Created by user on 20/10/2023.
//

import UIKit

final class CountButton: UIButton {

    enum CountButtonType {
        case plus
        case minus
    }

    convenience init(countType: CountButtonType) {
        self.init(type: .custom)
        let image = UIImage(systemName: countType == .plus ? Images.plusButton : Images.minusButton)
        tintColor = Colors.countButton
        setBackgroundImage(image, for: .normal)
        setSize(30, 30)
        addTarget(self, action: #selector(tapWithAnimation), for: .touchUpInside)
    }

    @objc func tapWithAnimation() {
        performTapAnimation()
    }
}

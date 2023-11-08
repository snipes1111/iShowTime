//
//  HeartButton.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import UIKit

class HeartButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAction(UIAction(performTapAnimation), for: .touchUpInside)
        setSize(35, 40)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func switchToShadedState() {
        setBackgroundImage(UIImage(systemName: Images.heartFilled), for: .normal)
        tintColor = .systemPink
    }

    func switchToBorderedState() {
        setBackgroundImage(UIImage(systemName: Images.heart), for: .normal)
        tintColor = .black
    }
}

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
        switchToBorderedState()
        addTarget(self, action: #selector(tapWithAnimation), for: .touchUpInside)
        setSize(35, 40)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapWithAnimation() {
        performTapAnimation()
    }

    func switchToShadedState() {
        setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        tintColor = .systemPink
    }

    func switchToBorderedState() {
        setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .black
    }
}

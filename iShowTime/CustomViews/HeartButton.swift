//
//  HeartButton.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 31/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

class HeartButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBorder()
        addAction(UIAction(performTapAnimation), for: .touchUpInside)
        setSize(35, 40)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addBorder() {
        let strokeImageView = UIImageView()
        addSubview(strokeImageView)
        strokeImageView.fillSuperView(self)
        strokeImageView.image = Images.heart
        strokeImageView.tintColor = .black
    }

    func setIsFavourite(_ isFavourite: Bool?) {
        guard let isFavourite = isFavourite else { return }
        DispatchQueue.main.async {
            isFavourite ? self.switchToShadedState() : self.switchToBorderedState()
        }
    }

    private func switchToShadedState() {
        setBackgroundImage(Images.heartFilled, for: .normal)
        tintColor = .systemPink

    }

    private func switchToBorderedState() {
        setBackgroundImage(nil, for: .normal)
        tintColor = .black
    }
}

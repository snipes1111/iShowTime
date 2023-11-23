//
//  SeriesButton.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 17/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton() {
        titleLabel?.font = Fonts.seriesButton
        setSize(50, 250)
        setBackgroundImage(UIImage(resource: .buttonActive), for: .normal)
        setBackgroundImage(UIImage(resource: .buttonTapped), for: .highlighted)
        addAction(UIAction(highlight), for: .touchDown)
        addAction(UIAction(backToOriginal), for: .touchUpInside)
        addAction(UIAction(backToOriginal), for: .touchCancel)
    }

    func switchToActiveState() {
        setTitle(Constants.Buttons.addToWatching, for: .normal)
        setTitleColor(.black, for: .normal)
    }

    func switchToTappedBeforeState() {
        setTitle(Constants.Buttons.removeFromWatching, for: .normal)
        setTitleColor(.darkGray, for: .normal)
    }

    private func highlight() {
        DispatchQueue.main.async {
            self.alpha = 0.7
            self.setBackgroundImage(UIImage(resource: .buttonTapped), for: .normal)
            let translation = CGAffineTransform(translationX: 1.0, y: 6)
            let scale = CGAffineTransform(scaleX: 1.0, y: 0.95)
            self.transform = CGAffineTransformConcat(translation, scale)
        }
    }

    private func backToOriginal() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.alpha = 1
            self.setBackgroundImage(UIImage(resource: .buttonActive), for: .normal)
            self.transform = .identity
        }
    }
}

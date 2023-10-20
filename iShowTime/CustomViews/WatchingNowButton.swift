//
//  WatchingNowButton.swift
//  iShowTime
//
//  Created by user on 17/10/2023.
//

import UIKit

class WatchingNowButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = Fonts.SearchDetailModule.watchingNowButton
        setBackgroundImage(UIImage(resource: .watchingNow), for: .normal)
        setBackgroundImage(UIImage(resource: .watchingPressed), for: .highlighted)
        addAction(buttonPressed(), for: .touchDown)
        addAction(buttonTouchCancel(), for: .touchUpInside)
        addAction(buttonTouchCancel(), for: .touchUpOutside)
        setSize(50, 250)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buttonPressed() -> UIAction {
        let action = UIAction { [unowned self] _ in
            highlight()
        }
        return action
    }

    private func buttonTouchCancel() -> UIAction {
        let action = UIAction { [unowned self] _ in
            backToOriginal()
        }
        return action
    }

    private func highlight() {
        self.alpha = 0.7
        setBackgroundImage(UIImage(resource: .watchingPressed), for: .normal)
        self.frame.origin.y += 3
        self.transform = CGAffineTransform(scaleX: 1.0, y: 0.95)
    }

    private func backToOriginal() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.frame.origin.y -= 3
            self.transform = .identity
            self.setBackgroundImage(UIImage(resource: .watchingNow), for: .normal)
            self.alpha = 1
        }
    }
}

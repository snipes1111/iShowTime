//
//  WatchingNowButton.swift
//  iShowTime
//
//  Created by user on 17/10/2023.
//

import UIKit

class WatchingNowButton: UIButton {

    private var isPressed: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("Add to Watching Now", for: .normal)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.font = Fonts.SearchDetailModule.watchingNowButton
        setTitleColor(.black, for: .normal)
        setBackgroundImage(UIImage(resource: .watchingNow), for: .normal)
        setBackgroundImage(UIImage(resource: .watchingPressed), for: .highlighted)
        addAction(buttonPressed(), for: .touchDown)
        addAction(buttonTouchCancel(), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buttonPressed() -> UIAction {
        let action = UIAction { [unowned self] _ in
            print("pressed")
            highlight()
        }
        return action
    }

    private func buttonTouchCancel() -> UIAction {
        let action = UIAction { [unowned self] _ in
            print("Cancel")
            backToOriginal()
        }
        return action
    }

    private func highlight() {
        setBackgroundImage(UIImage(resource: .watchingPressed), for: .normal)
        self.frame.origin.y += 3
        self.transform = CGAffineTransform(scaleX: 1.0, y: 0.95)
    }

    private func backToOriginal() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.frame.origin.y -= 3
            self.transform = .identity
            self.setBackgroundImage(UIImage(resource: .watchingNow), for: .normal)
        }
    }
}

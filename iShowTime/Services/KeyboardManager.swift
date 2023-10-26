//
//  KeyboardManager.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

class KeyboardManager {

    private let managedView: UIView

    init(_ managedView: UIView) {
        self.managedView = managedView
    }

    func addNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = (notification.userInfo) as? [String: Any],
              let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval)
        else { return }
        let keyboardHeight = keyboardSize.height
        UIView.animate(withDuration: animationDuration) {
            self.managedView.transform = CGAffineTransform(translationX: 1.0, y: -keyboardHeight)
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        guard
            let userInfo = (notification.userInfo) as? [String: Any],
            let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval)
        else { return }
        UIView.animate(withDuration: animationDuration) {
            self.managedView.transform = .identity
        }
    }
}

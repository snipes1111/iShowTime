//
//  CustomAnimation.swift
//  iShowTime
//
//  Created by user on 19/09/2023.
//

import UIKit

extension UIView {
    func addSpringAnimation(_ duration: Double) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            self.transform = .identity
        }
    }
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
    func fillSuperView(_ superView: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor, constant: padding).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -padding).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: padding).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -padding).isActive = true
    }
}

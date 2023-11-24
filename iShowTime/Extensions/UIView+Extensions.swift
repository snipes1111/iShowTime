//
//  UIView+Extensions.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

extension UIView {

    func addSpringAnimation() {
        UIView.animate(withDuration: 0.5) {
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

    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.masksToBounds = false
    }
}

extension UIView {
    func fillSuperView(_ superView: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor, constant: padding).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -padding).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: padding).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -padding).isActive = true
    }

    func fillContentView(_ contentView: UIView, padding: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding).isActive = true
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding).isActive = true
        let constraint = bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        constraint.priority = .defaultHigh
        constraint.isActive = true
    }

    func centerInSuperView(_ superView: UIView, sideInsets: CGFloat,
                           constantY: CGFloat = 0, constantX: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor,
                                 constant: sideInsets).isActive = true
        trailingAnchor.constraint(lessThanOrEqualTo: superView.trailingAnchor,
                                  constant: -sideInsets).isActive = true
        centerYAnchor.constraint(equalTo: superView.centerYAnchor,
                                 constant: constantY).isActive = true
        centerXAnchor.constraint(equalTo: superView.centerXAnchor,
                                 constant: constantX).isActive = true
    }

    func setSize(_ height: CGFloat, _ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

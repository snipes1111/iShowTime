//
//  SeriesProgressView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class SeriesProgressView: UIProgressView {
    init(_ height: CGFloat) {
        super.init(frame: .zero)
        trackTintColor = .lightGray.withAlphaComponent(0.4)
        progressTintColor = .systemGreen
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        layer.cornerRadius = height / 2
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

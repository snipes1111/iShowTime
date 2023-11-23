//
//  SeriesProgressView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 06/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesProgressView: UIProgressView {
    init(height: CGFloat) {
        super.init(frame: .zero)
        trackTintColor = Colors.trackTintColor
        progressTintColor = Colors.progressTintColor
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        layer.cornerRadius = height / 2
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

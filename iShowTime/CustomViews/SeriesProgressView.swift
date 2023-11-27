//
//  SeriesProgressView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 06/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesProgressView: UIProgressView {

    init() {
        super.init(frame: .zero)
        trackTintColor = Colors.trackTintColor
        progressTintColor = Colors.progressTintColor
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        setCornerRadiusToProgress()
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setCornerRadiusToProgress() {
        guard let progressLayer = layer.sublayers?[1] else { return }
        let progressSubview = subviews[1]
        progressLayer.cornerRadius = 8
        progressSubview.clipsToBounds = true
    }

    private func setProgressColor(progress: Float) {
        let color: UIColor
        switch progress {
        case 0..<0.3: color = UIColor.systemOrange
        case 0.3..<0.7: color = UIColor.systemYellow
        default: color = UIColor.systemGreen
        }
        progressTintColor = color
    }

    override func setProgress(_ progress: Float, animated: Bool) {
        super.setProgress(progress, animated: animated)
        setProgressColor(progress: progress)
    }
}

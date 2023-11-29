//
//  SeriesProgressView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 06/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SeriesProgressView: UIProgressView {

    private let firstColor: UIColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
    private let secondColor: UIColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1)

    private func updateView() {
        let bounds = CGRect(origin: .zero, size: .init(width: 100, height: 100))
        if let gradientImage = UIImage(bounds: bounds, colors: [firstColor, secondColor]) {
            progressImage = gradientImage
        }
    }
    
    init(bordered: Bool = false) {
        super.init(frame: .zero)
        trackTintColor = Colors.trackTintColor
        layer.cornerRadius = 8
        if bordered {
            layer.borderWidth = 1.0
            layer.borderColor = UIColor.black.withAlphaComponent(0.7).cgColor
        }
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

    override func setProgress(_ progress: Float, animated: Bool) {
        super.setProgress(progress, animated: animated)
        updateView()
    }
}

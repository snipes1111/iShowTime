//
//  VerticalStackView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class VerticalStackView: UIStackView {
    init(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, arrangedSubviews: [UIView?]) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        addArrangedSubviews(arrangedSubviews)
        self.distribution = distribution
        self.spacing = spacing
        axis = .vertical
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  VerticalStackView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class VerticalStackView: UIStackView {
    init(spacing: CGFloat = 4, arrangedSubviews: [UIView?], distribution: UIStackView.Distribution = .fill) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        arrangedSubviews.forEach { subview in
            guard let subview = subview else { return }
            addArrangedSubview(subview)
        }
        self.distribution = distribution
        axis = .vertical
        self.spacing = spacing
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

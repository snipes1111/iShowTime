//
//  HorizontalStackView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class HorizontalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 12) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        arrangedSubviews.forEach { addArrangedSubview($0) }
        self.spacing = spacing
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

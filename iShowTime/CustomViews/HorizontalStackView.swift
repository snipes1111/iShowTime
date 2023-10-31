//
//  HorizontalStackView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class HorizontalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 12) {
        super.init(frame: .zero)
        arrangedSubviews.forEach { addArrangedSubview($0) }
        self.spacing = spacing
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

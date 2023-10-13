//
//  VerticalStackView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class VerticalStackView: UIStackView {
    init(spacing: CGFloat = 4, arrangedSubviews: [UIView]) {
        super.init(frame: .zero)
        arrangedSubviews.forEach { addArrangedSubview($0) }
        axis = .vertical
        alignment = .fill
        self.spacing = spacing
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

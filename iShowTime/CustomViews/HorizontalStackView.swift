//
//  HorizontalStackView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 06/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class HorizontalStackView: UIStackView {
    init(spacing: CGFloat = 8, arrangedSubviews: [UIView]) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        addArrangedSubviews(arrangedSubviews)
        self.spacing = spacing
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

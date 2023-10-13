//
//  HorizontalStackView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class HorizontalStackView: UIStackView {
    init(arrangedSubviews: [UIView]) {
        super.init(frame: .zero)
        arrangedSubviews.forEach { addArrangedSubview($0) }
        axis = .horizontal
        alignment = .fill
        distribution = .fillProportionally
        spacing = 12
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  VerticalStackView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubviews: [UIView]) {
        super.init(frame: .zero)
        arrangedSubviews.forEach { addArrangedSubview($0) }
        axis = .vertical
        alignment = .fill
        spacing = 4
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

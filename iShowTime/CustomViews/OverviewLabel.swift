//
//  OverviewLabel.swift
//  iShowTime
//
//  Created by user on 01/11/2023.
//

import UIKit

class OverviewLabel: UILabel {
    init(font: UIFont, numberOfLines: Int) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        self.font = font
        self.numberOfLines = numberOfLines
        isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

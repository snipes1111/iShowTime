//
//  SpinnerView.swift
//  iShowTime
//
//  Created by user on 14/10/2023.
//

import UIKit

class SpinnerView: UIActivityIndicatorView {
    init() {
        super.init(style: .large)
        color = Colors.spinnerColor
        hidesWhenStopped = true
        translatesAutoresizingMaskIntoConstraints = false
        startAnimating()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

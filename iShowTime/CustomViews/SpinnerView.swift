//
//  SpinnerView.swift
//  iShowTime
//
//  Created by user on 14/10/2023.
//

import UIKit

final class SpinnerView: UIActivityIndicatorView {
    init() {
        super.init(style: .large)
        color = Colors.spinner
        hidesWhenStopped = true
        startAnimating()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

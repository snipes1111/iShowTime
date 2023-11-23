//
//  SpinnerView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 14/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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

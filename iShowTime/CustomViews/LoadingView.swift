//
//  LoadingView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 26/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class LoadingView: UIView {
    private let spinner = SpinnerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        createSpinner()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createSpinner() {
        addSubview(spinner)
        spinner.fillSuperView(self)
    }
}

extension LoadingView {
    func hideWithAnimation() {
        UIView.animate(withDuration: 0.7) { [unowned self] in
            alpha = 0
            spinner.stopAnimating()
        } completion: { [unowned self] _ in
            isHidden = true
        }
    }
}

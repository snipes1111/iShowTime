//
//  LoadingView.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

class LoadingView: UIView {
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

    func hideWithAnimation() {
        UIView.animate(withDuration: 0.7) { [unowned self] in
            alpha = 0
            spinner.stopAnimating()
        } completion: { [unowned self] _ in
            isHidden = true
        }
    }
}

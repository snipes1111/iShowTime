//
//  SearchDetailView+Extensions.swift
//  iShowTime
//
//  Created by user on 12/10/2023.
//

import UIKit

extension SearchDetailView {
    func createBlurBackgroundView() {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        tableView.backgroundView?.addSubview(blurView)
        blurView.fillSuperView(self)
        sendSubviewToBack(blurView)
        blurBackgroundView = blurView
    }

    func createBackDropImageView() {
        let imageView = SeriesImageView()
        imageView.backgroundColor = .white
        addSubview(imageView)
        imageView.fillSuperView(self)
        sendSubviewToBack(imageView)
        backDropImageView = imageView
    }

    func updateBackDropImageView() {
        backDropImageView.getImage(viewModel.backDropImageUrl)
    }
}

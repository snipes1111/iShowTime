//
//  WatchingNowDetailView.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailView: UIView {

    var viewModel: SeriesDetailViewModelProtocol
    var tableView: UITableView!
    var backDropImageView: SeriesImageView!
    var loadingView: UIView!
    var spinner: UIActivityIndicatorView!

    init(viewModel: SeriesDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func subscribeToViewModel() {
        viewModel.viewModelDidChange = { _ in
            DispatchQueue.main.async { [unowned self] in
                updateBackDropImageView()
                hideLoadingView()
            }
        }
    }

    func updateBackDropImageView() {
        backDropImageView.getImage(viewModel.backDropImageUrl)
    }

    func hideLoadingView() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            loadingView.alpha = 0
            spinner.stopAnimating()
        } completion: { [unowned self] _ in
            loadingView.isHidden = true
        }
    }
}

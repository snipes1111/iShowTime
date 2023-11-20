//
//  SearchDetailView.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

final class SearchDetailView: UIView {

    var viewModel: SearchDetailViewModelProtocol
    var tableView: UITableView!
    var blurBackgroundView: UIView!
    var backDropImageView: SeriesImageView!
    var loadingView: UIView!
    var spinner: UIActivityIndicatorView!

    init(viewModel: SearchDetailViewModelProtocol) {
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
                tableView.reloadData()
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

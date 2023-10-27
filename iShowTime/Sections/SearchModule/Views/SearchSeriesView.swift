//
//  SearchSeriesView.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

final class SearchSeriesView: BaseSectionView {

    private lazy var searchViewModel: SearchSeriesViewModelProtocol? = {
        viewModel as? SearchSeriesViewModelProtocol
    }()

    var shouldSetupConstraints = true

    var searchPromptLabel: UILabel!
    var spinner: UIActivityIndicatorView!

    override func setupUI() {
        super.setupUI()
        setupSubviews()
        bindWithLoadingState()
    }

    override func updateConstraints() {
        updateSubviewsConstraints()
        super.updateConstraints()
    }

    func bindWithLoadingState() {
        searchViewModel?.loadingState.bind { _ in
            DispatchQueue.main.async { [unowned self] in
                updateSearchPromptLabel()
                manageSpinner()
                tableView.reloadData()
            }
        }
    }

    func updateSearchPromptLabel() {
        searchPromptLabel.isHidden = searchViewModel?.promptLabelIsHidden ?? false
        searchPromptLabel.text = searchViewModel?.promptLabelText
    }

    func manageSpinner() {
        switch searchViewModel?.loadingState.value {
        case .loading: spinner.startAnimating()
        default: spinner.stopAnimating()
        }
    }
}

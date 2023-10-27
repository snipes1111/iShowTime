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
    private var needToUpdateConstraints: Bool = true

    var searchPromptLabel: UILabel!
    var spinner: UIActivityIndicatorView!
    var loadingVStack: UIStackView!

    override func setupUI() {
        super.setupUI()
        setupSubviews()
        updateSearchPromptLabel()
        bindWithLoadingState()
    }

    override func updateConstraints() {
        if needToUpdateConstraints {
            updateLoadingVStackConstraints()
            needToUpdateConstraints = false
        }
        super.updateConstraints()
    }

    private func bindWithLoadingState() {
        searchViewModel?.loadingState.bind { [unowned self] _ in
            updateUI()
        }
    }
}

extension SearchSeriesView {

    private func updateUI() {
        DispatchQueue.main.async { [unowned self] in
            updateSearchPromptLabel()
            manageSpinner()
            tableView.reloadData()
        }
    }

    private func updateSearchPromptLabel() {
        searchPromptLabel.isHidden = searchViewModel?.promptLabelIsHidden ?? false
        searchPromptLabel.text = searchViewModel?.promptLabelText
    }

    private func manageSpinner() {
        switch searchViewModel?.loadingState.value {
        case .loading: spinner.startAnimating()
        default: spinner.stopAnimating()
        }
    }
}

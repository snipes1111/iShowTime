//
//  SearchSeriesView.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

final class SearchSeriesView: UIView {

    var shouldSetupConstraints = true

    var searchPromptLabel: UILabel!
    var spinner: UIActivityIndicatorView!
    var tableView: UITableView!
    var viewModel: SearchSeriesViewModelProtocol

    init(viewModel: SearchSeriesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        updateSubviewsConstraints()
        super.updateConstraints()
    }

    func subscribeToViewModel() {
        viewModel.viewModelDidChange = { _ in
            DispatchQueue.main.async { [unowned self] in
                tableView.reloadData()
            }
        }
        bindWithLoadingState()
    }

    func bindWithLoadingState() {
        viewModel.loadingState.bind { _ in
            DispatchQueue.main.async { [unowned self] in
                updateSearchPromptLabel()
                manageSpinner()
                tableView.reloadData()
            }
        }
    }

    func updateSearchPromptLabel() {
        searchPromptLabel.isHidden = viewModel.promptLabelIsHidden
        searchPromptLabel.text = viewModel.promptLabelText
    }

    func manageSpinner() {
        switch viewModel.loadingState.value {
        case .loading: spinner.startAnimating()
        default: spinner.stopAnimating()
        }
    }
}

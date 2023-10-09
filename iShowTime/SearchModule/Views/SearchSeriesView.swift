//
//  SearchSeriesView.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

class SearchSeriesView: UIView {

    var shouldSetupConstraints = true

    var searchPromptLabel: UILabel!
    var spinner: UIActivityIndicatorView!
    var tableView: UITableView!
    var viewModel: SearchSeriesViewModelProtocol!

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
        viewModel.viewModelDidChange = { [unowned self] _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        bindWithLoadingState()
    }

    func bindWithLoadingState() {
        viewModel.loadingState.bind { loadingState in
            DispatchQueue.main.async {
                self.updateSearchPromptLabel()
                self.manageSpinner(loadingState)
                self.tableView.reloadData()
            }
        }
    }

    func updateSearchPromptLabel() {
        searchPromptLabel.isHidden = viewModel.promptLabelIsHidden
        searchPromptLabel.text = viewModel.promptLabelText
    }

    func manageSpinner(_ loadingState: LoadingState) {
        if loadingState == .loading {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
}

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
        bindWithIsLoadingState()
    }

    func bindWithIsLoadingState() {
        viewModel.isLoading.bind { [unowned self] isLoading in
            DispatchQueue.main.async {
                self.updateSearchPromptLabel()
                self.manageSpinner(isLoading)
                self.tableView.reloadData()
            }
        }
    }

    func updateSearchPromptLabel() {
        searchPromptLabel.isHidden = viewModel.promptLabelIsHidden
        searchPromptLabel.text = viewModel.promptLabelText
    }

    func manageSpinner(_ isLoading: Bool) {
        if isLoading {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
}

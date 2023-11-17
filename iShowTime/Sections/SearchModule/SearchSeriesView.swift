//
//  SearchSeriesView.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

final class SearchSeriesView: BaseSectionView {

    private var needToUpdateConstraints: Bool = true
    private var spinner: UIActivityIndicatorView!
    private var loadingStack: UIStackView!

    private lazy var searchViewModel: SearchSeriesViewModelProtocol? = {
        viewModel as? SearchSeriesViewModelProtocol
    }()

    override func setupUI() {
        super.setupUI()
        setupLoadingVStack()
        bindWithLoadingState()
    }

    override func updateConstraints() {
        if needToUpdateConstraints {
            setLoadingVStackConstraints()
            needToUpdateConstraints = false
        }
        super.updateConstraints()
    }

    private func bindWithLoadingState() {
        searchViewModel?.loadingState.bind { state in
            DispatchQueue.main.async { [unowned self] in
                if state == .loading { spinner.startAnimating() }
                else { spinner.stopAnimating() }
                updatePromptLabel()
                tableView.reloadData()
            }
        }
    }
}

extension SearchSeriesView {

    func setupLoadingVStack() {
        spinner = SpinnerView()
        loadingStack = HorizontalStackView(arrangedSubviews: [promptLabel, spinner])
        tableView.addSubview(loadingStack)
    }

    func setLoadingVStackConstraints() {
        loadingStack.centerInSuperView(tableView, sideInsets: 16, constantY: -navBarSize())
    }

    private func navBarSize() -> CGFloat {
        let vc = findViewController()
        let navBarFrame = vc?.navigationController?.navigationBar.frame
        return navBarFrame?.maxY ?? 0
    }
}

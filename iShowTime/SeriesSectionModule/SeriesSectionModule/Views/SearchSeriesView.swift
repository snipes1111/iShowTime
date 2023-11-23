//
//  SearchSeriesView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 08/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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
    //redefine constraints after the frame of the view will be known
    override func updateConstraints() {
        if needToUpdateConstraints {
            setLoadingVStackConstraints()
            needToUpdateConstraints = false
        }
        super.updateConstraints()
    }

    private func bindWithLoadingState() {
        searchViewModel?.loadingState.bind { [weak self] state in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if state == .loading { self.spinner.startAnimating() }
                else { self.spinner.stopAnimating() }
                self.updatePromptLabel()
                self.tableView.reloadData()
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

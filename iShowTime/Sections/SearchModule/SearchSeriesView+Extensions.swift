//
//  SearchSeriesView+Extensions.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import UIKit

extension SearchSeriesView {

    func setupPromptVStack() {
        spinner = SpinnerView()
        loadingStack = HorizontalStackView(arrangedSubviews: [promptLabel, spinner])
        tableView.addSubview(loadingStack)
    }

    func setupLoadingVStackConstraints() {
        let topInset = calculatedNavBarSize()
        loadingStack.translatesAutoresizingMaskIntoConstraints = false
        loadingStack.topAnchor.constraint(equalTo: tableView.topAnchor, constant: topInset).isActive = true
        loadingStack.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16).isActive = true
        loadingStack.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16).isActive = true
        loadingStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func calculatedNavBarSize() -> CGFloat {
        guard let searchViewController = findViewController() as? SearchSeriesViewController else { return 0 }
        if let searchBarFrame = searchViewController.navigationController?.navigationBar.frame {
            let topInset = searchBarFrame.origin.y
            let height = searchBarFrame.height
            return topInset + height
        }
        return 0
    }
}

//
//  SearchSeriesView+Extensions.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import UIKit

extension SearchSeriesView {

    func setupSubviews() {
        backgroundColor = .white
        setupLabelAndSpinner()
    }

    private func setupLabelAndSpinner() {
        searchPromptLabel = UILabel(font: Fonts.SearchModule.promptLabelFont,
                            color: Colors.searchModulePromptTextColor)
        searchPromptLabel.textAlignment = .center
        spinner = SpinnerView()
        loadingVStack = VerticalStackView(spacing: 16, arrangedSubviews: [searchPromptLabel, spinner])
        tableView.addSubview(loadingVStack)
    }

    func updateLoadingVStackConstraints() {
        let topInset = calculatedNavBarSize()
        loadingVStack.translatesAutoresizingMaskIntoConstraints = false
        loadingVStack.topAnchor.constraint(equalTo: tableView.topAnchor, constant: topInset).isActive = true
        loadingVStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        loadingVStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
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

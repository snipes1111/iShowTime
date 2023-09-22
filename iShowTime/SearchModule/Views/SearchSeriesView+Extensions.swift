//
//  SearchSeriesView+Extensions.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import UIKit

extension SearchSeriesView {

    func setupUI() {
        backgroundColor = .white
        createTableView()
        createAndAddSearchPromptLabel()
        createAndAddSpinner()
        updateSearchPromptLabel()
    }

    func createAndAddSearchPromptLabel() {
        let label = UILabel()
        label.font = Fonts.searchModulePromptLabelFont
        label.textColor = Colors.searchModulePromptTextColor
        searchPromptLabel = label
        tableView.addSubview(searchPromptLabel)
    }

    func setupSearchPromptLabelConstraints() {
        searchPromptLabel.translatesAutoresizingMaskIntoConstraints = false
        searchPromptLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        searchPromptLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor,
                                                   constant: -calculatedNavBarSize()).isActive = true
    }

    func calculatedNavBarSize() -> CGFloat {
        guard let searchViewController = findViewController() as? SearchSeriesViewController else { return 0 }
        if let searchBarFrame = searchViewController.navigationController?.navigationBar.frame {
            let topInset = searchBarFrame.origin.y
            let height = searchBarFrame.height
            return topInset + height
        }
        return 0
    }

    func createAndAddSpinner() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.color = Colors.spinnerColor
        self.spinner = spinner
        addSubview(spinner)
    }

    func setupSpinnerConstraints() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.bottomAnchor.constraint(equalTo: searchPromptLabel.topAnchor, constant: -20).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func updateSubviewsConstraints() {
        if shouldSetupConstraints {
            setupSearchPromptLabelConstraints()
            setupSpinnerConstraints()
            shouldSetupConstraints = false
        }
    }
}

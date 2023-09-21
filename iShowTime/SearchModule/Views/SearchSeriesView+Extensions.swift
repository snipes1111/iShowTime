//
//  SearchSeriesView+Extensions.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import UIKit

extension SearchSeriesView {

    func setupUI() {
        setBackgroundColor()
        createSearchPromptLabel()
        setupSearchPromptLabelConstraints()
    }

    func setBackgroundColor() {
        backgroundColor = .white
    }

    func createSearchPromptLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.searchModulePromptLabelFont
        label.textColor = Colors.searchModulePromptTextColor
        searchPromptLabel = label
    }

    func setupSearchPromptLabelConstraints() {
        addSubview(searchPromptLabel)
        searchPromptLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchPromptLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}

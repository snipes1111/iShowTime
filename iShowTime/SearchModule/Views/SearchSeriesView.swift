//
//  SearchSeriesView.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

class SearchSeriesView: UIView {

    let searchPromptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = SearchModuleConstants.searchPromptText
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .systemGray
        return label
    }()

    override func layoutSubviews() {
        backgroundColor = .white
        setupSearchPromptLabelConstraints()
    }

    func setupSearchPromptLabelConstraints() {
        addSubview(searchPromptLabel)
        searchPromptLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchPromptLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

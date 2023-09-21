//
//  SearchSeriesView.swift
//  iShowTime
//
//  Created by user on 08/09/2023.
//

import UIKit

class SearchSeriesView: UIView {

    var searchPromptLabel: UILabel!
    var viewModel: SearchSeriesViewModelProtocol!

    init(viewModel: SearchSeriesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        setSearchPromptLabelText()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func subscribeToViewModel() {
        viewModel.viewModelDidChange = { [unowned self] _ in
            setSearchPromptLabelText()
        }
    }

    func setSearchPromptLabelText() {
        searchPromptLabel.text = viewModel.promptText
    }
}

//
//  SearchSeriesViewModel.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import Foundation

protocol SearchSeriesViewModelProtocol {
    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)? { get set }
    var promptText: String { get set }
    func searchStarted()
}

class SearchSeriesViewModel: SearchSeriesViewModelProtocol {
    private var tempText: String = SearchModuleConstants.searchPromptText
    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)?
    var promptText: String {
        get {
            tempText
        } set {
            tempText = newValue
            viewModelDidChange?(self)
        }
    }

    func searchStarted() {
        promptText = "Search for something?"
    }
}

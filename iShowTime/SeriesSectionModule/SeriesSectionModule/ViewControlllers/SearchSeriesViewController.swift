//
//  SearchSeriesViewController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 16/05/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SearchSeriesViewController: BaseSectionViewController {

    var searchController: UISearchController!
    private lazy var searchViewModel: SearchSeriesViewModelProtocol? = {
        viewModel as? SearchSeriesViewModelProtocol
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchViewModel?.setSearchText(nil)
    }

    private func createSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = true
    }
}

extension SearchSeriesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel?.setSearchText(searchText)
    }
}

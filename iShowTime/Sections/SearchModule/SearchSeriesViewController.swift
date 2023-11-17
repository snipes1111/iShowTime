//
//  ViewController.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
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

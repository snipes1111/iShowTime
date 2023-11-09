//
//  ViewController.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
//

import UIKit

final class SearchSeriesViewController: BaseSectionViewController {

    private var searchController: UISearchController!
    private lazy var searchViewModel: SearchSeriesViewModelProtocol? = {
        viewModel as? SearchSeriesViewModelProtocol
    }()

    override func setupUI() {
        super.setupUI()
        createSearchBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
    }

    private func createSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}

extension SearchSeriesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel?.setSearchText(searchText)
    }
}

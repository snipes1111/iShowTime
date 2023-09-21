//
//  ViewController.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
//

import UIKit

class SearchSeriesViewController: UIViewController {

    var viewModel: SearchSeriesViewModel!

    private var searchController = UISearchController(searchResultsController: nil)
    var searchView: SearchSeriesView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.frame = view.frame
        view = searchView
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}

extension SearchSeriesViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        viewModel.searchStarted()
        return true
    }
}

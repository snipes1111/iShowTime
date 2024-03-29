//
//  ViewController.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
//

import UIKit

final class SearchSeriesViewController: UIViewController {

    var viewModel: SearchSeriesViewModel!
    var searchView: SearchSeriesView!

    private var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchView()
        createSearchBar()
        setBackButtonText()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
    }

    func createSearchView() {
        searchView.frame = view.frame
        view.addSubview(searchView)
    }

    func createSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }

    func setBackButtonText() {
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.tintColor = .black
    }
}

extension SearchSeriesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchSeries(searchText)
    }
}

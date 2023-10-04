//
//  ViewController.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
//

import UIKit

class SearchSeriesViewController: UIViewController {

    var viewModel: SearchSeriesViewModel!
    var searchView: SearchSeriesView!

    private var searchController: UISearchController!
    let networkManager = NetworkService()
    let decoder = SeriesDecoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchView()
        createSearchBar()
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
}

extension SearchSeriesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //viewModel.fetchSeries(searchText)
        guard searchText.count > 6 else { return }
        Task {
            let data = try? await networkManager.fetchSeriesData(searchText)
            if let data = data {
                let series = decoder.decodeSeriesFromData(data)
                print(series)
            }
        }
    }
}

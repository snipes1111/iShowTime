//
//  ViewController.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
//

import UIKit

class SearchSeriesViewController: UIViewController {

    private var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchView = SearchSeriesView()
        searchView.frame = view.frame
        self.view = searchView
        navigationItem.searchController = searchController
    }
}

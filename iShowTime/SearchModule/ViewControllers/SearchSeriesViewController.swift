//
//  ViewController.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
//

import UIKit

class SearchSeriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchView = SearchSeriesView()
        searchView.frame = view.frame
        self.view = searchView
    }
    
}

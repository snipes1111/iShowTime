//
//  SearchSeriesDetailViewController.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

final class SearchSeriesDetailViewController: UIViewController {

    var searchDetailView: SearchDetailView!
    var viewModel: SearchDetailViewModelProtocol!

    override func viewDidLoad() {
        createSearchDetailView()
        viewModel.fetchSeriesDetails()
    }

    convenience init(title: String) {
        self.init(nibName: nil, bundle: nil)
        self.title = title
    }

    func createSearchDetailView() {
        searchDetailView.frame = view.frame
        view.addSubview(searchDetailView)
    }
}

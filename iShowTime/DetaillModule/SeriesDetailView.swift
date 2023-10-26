//
//  SeriesDetailView.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

class SeriesDetailView: UIView {

    var viewModel: SeriesDetailViewModelProtocol
    var tableView: UITableView!
    var backDropImageView: SeriesImageView!
    var loadingView: UIView!
    var spinner: UIActivityIndicatorView!

    var cellIdentifier: String {
        "cell"
    }
    var cellType: UITableViewCell.Type {
        UITableViewCell.self
    }
    var tableViewTopInset: CGFloat {
        0
    }

    init(viewModel: SeriesDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        subscribeToViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func subscribeToViewModel() {
        let dispatchGroup = DispatchGroup()
        let workItemOne = DispatchWorkItem(block: updateBackDropImageView)
        let workItemTwo = DispatchWorkItem {
            self.tableView.reloadData()
        }
        let workItemThree = DispatchWorkItem(block: hideLoadingView)
        viewModel.viewModelDidChange = { _ in
            DispatchQueue.main.async(group: dispatchGroup, execute: workItemOne)
            DispatchQueue.main.async(group: dispatchGroup, execute: workItemTwo)
            DispatchQueue.main.async(group: dispatchGroup, execute: workItemThree)
        }
    }

    func updateBackDropImageView() {
        backDropImageView.getImage(viewModel.backDropImageUrl)
    }

    func hideLoadingView() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            loadingView.alpha = 0
            spinner.stopAnimating()
        } completion: { [unowned self] _ in
            loadingView.isHidden = true
        }
    }
}

extension SeriesDetailView {
    func setupUI() {
        createTableView()
        createLoadingView()
        createSpinner()
    }

    func createLoadingView() {
        loadingView = UIView()
        loadingView.backgroundColor = .black
        addSubview(loadingView)
        loadingView.fillSuperView(self)
    }

    func createSpinner() {
        self.spinner = SpinnerView()
        addSubview(spinner)
        spinner.fillSuperView(self)
    }
}

extension SeriesDetailView {

    func createTableView() {
        tableView = UITableView()
        tableView.contentInset.top = tableViewTopInset
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType,
                           forCellReuseIdentifier: cellIdentifier)
        addTableViewToView()
        createTableViewBackGroundView()
    }

    func addTableViewToView() {
        addSubview(tableView)
        tableView.fillSuperView(self)
    }

    func createTableViewBackGroundView() {
        let view = UIView()
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        tableView.backgroundView = view
        backDropImageView = SeriesImageView()
        view.addSubview(backDropImageView)
        backDropImageView.fillSuperView(view)
        view.addSubview(blurView)
        blurView.fillSuperView(view)
    }
}

extension SeriesDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension SeriesDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configuredDetailCell(indexPath, cellType)
    }

    func configuredDetailCell(_ indexPath: IndexPath, _ cellType: UITableViewCell.Type) -> UITableViewCell {
        var cell = DetailCell()
        if let type = cellType as? SearchDetailCell.Type {
            if let detaiCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                             for: indexPath) as? SearchDetailCell {
                cell = detaiCell
            }
        } else if let type = cellType as? WatchingNowDetailCell.Type {
            if let detaiCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                             for: indexPath) as? WatchingNowDetailCell {
                cell = detaiCell
            }
        } else { return UITableViewCell() }
        cell.viewModel = viewModel.returnDetailCellViewModel()
        return cell
    }
}

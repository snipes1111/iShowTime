//
//  WatchingNowDetailView+TableView.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

import UIKit

extension WatchingNowDetailView {

    func createTableView() {
        tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WatchingNowDetailViewCell.self,
                           forCellReuseIdentifier: WatchingNowConstants.detailSeriesCellIdentifier)
        addTableView()
        setBackGroundView()
    }

    func setBackGroundView() {
        let backGroundView = UIView()
        tableView.backgroundView = backGroundView

        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        let imageView = SeriesImageView()
        backDropImageView = imageView

        backGroundView.addSubview(imageView)
        imageView.fillSuperView(backGroundView)

        backGroundView.addSubview(blurView)
        blurView.fillSuperView(backGroundView)
    }

    func addTableView() {
        addSubview(tableView)
        setTableViewConstraints()
    }

    func setTableViewConstraints() {
        tableView.fillSuperView(self)
    }

}

extension WatchingNowDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension WatchingNowDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configuredDetailCell(indexPath)
    }

    func configuredDetailCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WatchingNowConstants.detailSeriesCellIdentifier,
                                                       for: indexPath) as? WatchingNowDetailViewCell
        else { return UITableViewCell() }
        cell.viewModel = viewModel.returnDetailCellViewModel()
        return cell
    }
}

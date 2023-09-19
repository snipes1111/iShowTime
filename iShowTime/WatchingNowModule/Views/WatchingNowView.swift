//
//  WatchingNowView.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class WatchingNowView: UIView {

    private let tableView: UITableView
    private let reuseIdentifier = "cell"

    var viewModel: WatchingNowViewModelProtocol!

    override init(frame: CGRect) {
        tableView = UITableView()
        super.init(frame: frame)
        addTableView()
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WatchingNowView: UITableViewDataSource, UITableViewDelegate {

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WatchingNowSeriesCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfSeries
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        bounds.height / 5
    }
}

extension WatchingNowView {
    private func addTableView() {
        addSubview(tableView)
        setTableViewConstraints()
    }

    private func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

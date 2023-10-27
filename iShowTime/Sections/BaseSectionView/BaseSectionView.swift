//
//  BaseSectionView.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import UIKit

class BaseSectionView: UIView {

    let tableView: UITableView

    private(set) var viewModel: (SectionViewModelProtocol & SectionViewModelRepresentableProtocol)

    init(viewModel: (SectionViewModelProtocol & SectionViewModelRepresentableProtocol)) {
        self.viewModel = viewModel
        tableView = UITableView()
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        setupTableView()
        addTableViewToView()
        subscribeToViewModel()
    }

    func subscribeToViewModel() {
        viewModel.viewModelDidChange = { _ in
            DispatchQueue.main.async { [unowned self] in
                tableView.reloadData()
            }
        }
    }
}

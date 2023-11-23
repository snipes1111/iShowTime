//
//  BaseSectionView.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 27/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

class BaseSectionView: UIView {

    private(set) var viewModel: (SectionViewModelProtocol & SectionViewModelRepresentableProtocol)

    let tableView: UITableView = UITableView()
    let promptLabel: UILabel = UILabel(font: Fonts.promptLabel, color: Colors.promptLabel)

    init(viewModel: (SectionViewModelProtocol & SectionViewModelRepresentableProtocol)) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        setupTableView()
        setupPromptLabel()
        subscribeToViewModel()
    }

    private func setupPromptLabel() {
        promptLabel.textAlignment = .center
        updatePromptLabel()
        addSubview(promptLabel)
        promptLabel.centerInSuperView(self, sideInsets: 32)
    }

    func subscribeToViewModel() {
        viewModel.viewModelDidChange = { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updatePromptLabel()
                self.tableView.reloadData()
            }
        }
    }

    func updatePromptLabel() {
        promptLabel.isHidden = viewModel.promptLabelIsHidden
        promptLabel.text = viewModel.promptLabelText
    }
}

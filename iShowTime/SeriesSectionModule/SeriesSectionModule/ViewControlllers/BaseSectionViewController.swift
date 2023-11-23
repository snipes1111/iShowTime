//
//  BaseSectionViewController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 27/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

class BaseSectionViewController: UIViewController {
    var viewModel: SectionViewModelRepresentableProtocol!
    var mainView: BaseSectionView!

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
    }

    private func setupBackButton() {
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.tintColor = .black
    }
}

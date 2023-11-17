//
//  BaseSectionViewController.swift
//  iShowTime
//
//  Created by user on 27/10/2023.
//

import UIKit

class BaseSectionViewController: UIViewController {
    var viewModel: SectionViewModelRepresentableProtocol!
    var mainView: BaseSectionView!

    override func loadView() {
        super.loadView()
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

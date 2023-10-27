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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        createMainView()
        setBackButtonText()
    }

    private func createMainView() {
        view.addSubview(mainView)
        mainView.fillSuperView(view)
    }

    private func setBackButtonText() {
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.tintColor = .black
    }
}

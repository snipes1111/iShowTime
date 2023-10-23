//
//  WatchingNowDetailViewController.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailViewController: UIViewController {

    var watchingNowDetailView: WatchingNowDetailView!
    var viewModel: SeriesDetailViewModelProtocol!

    override func viewDidLoad() {
        createSearchDetailView()
        viewModel.fetchSeriesDetails()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    convenience init(title: String) {
        self.init(nibName: nil, bundle: nil)
        self.title = title
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = (notification.userInfo) as? [String: Any],
              let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval)
        else { return }
        let keyboardHeight = keyboardSize.height
        UIView.animate(withDuration: animationDuration) {
            self.watchingNowDetailView.transform = CGAffineTransform(translationX: 1.0, y: -keyboardHeight)
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        guard
            let userInfo = (notification.userInfo) as? [String: Any],
            let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval)
        else { return }
        UIView.animate(withDuration: animationDuration) {
            self.watchingNowDetailView.transform = .identity
        }
    }

    func createSearchDetailView() {
        watchingNowDetailView.frame = view.frame
        view.addSubview(watchingNowDetailView)
    }
}

//
//  WatchingNowDetailViewController.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailViewController: SeriesDetailViewController {

    private var keyboardManager: KeyboardManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        createKeyboardManager()
    }

    func createKeyboardManager() {
        keyboardManager = KeyboardManager(mainView)
        keyboardManager.addNotifications()
    }
}

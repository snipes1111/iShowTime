//
//  WatchingNowDetailViewController.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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

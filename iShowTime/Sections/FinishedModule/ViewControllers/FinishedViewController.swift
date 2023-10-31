//
//  Finished.swift
//  iShowTime
//
//  Created by user on 11/09/2023.
//

import UIKit

class FinishedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let finishedView = FinishedView()
        finishedView.frame = view.frame
        view = finishedView
    }

}

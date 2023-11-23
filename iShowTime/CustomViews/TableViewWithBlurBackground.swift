//
//  TableViewWithBlurBackground.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 26/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class TableViewWithBlurBackground: UITableView {

    var backDropImageView = SeriesImageView()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        allowsSelection = false
        separatorStyle = .none
        addBackGroundView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addBackGroundView() {
        let view = UIView()
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        backgroundView = view
        view.addSubview(backDropImageView)
        backDropImageView.fillSuperView(view)
        view.addSubview(blurView)
        blurView.fillSuperView(view)
    }
}

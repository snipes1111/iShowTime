//
//  DetailTableView.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import UIKit

class DetailTableView: UITableView {

    var backDropImageView = SeriesImageView()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        allowsSelection = false
        separatorStyle = .none
        createBackGroundView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createBackGroundView() {
        let view = UIView()
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        backgroundView = view
        view.addSubview(backDropImageView)
        backDropImageView.fillSuperView(view)
        view.addSubview(blurView)
        blurView.fillSuperView(view)
    }

}

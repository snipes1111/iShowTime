//
//  WatchingNowDetailView.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import UIKit

final class WatchingNowDetailView: SeriesDetailView {
    override var cellType: UITableViewCell.Type {
        WatchingNowDetailCell.self
    }
}

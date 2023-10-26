//
//  SearchDetailView.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

final class SearchDetailView: SeriesDetailView {
    override var cellIdentifier: String {
        SearchModuleConstants.detailSeriesCellIdentifier
    }
    override var cellType: UITableViewCell.Type {
        SearchDetailCell.self
    }
    override var tableViewTopInset: CGFloat {
        60
    }
}

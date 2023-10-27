//
//  WatchingNowCellViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

class WatchingNowCellViewModel: SeriesCellViewModel {

    override var secondaryLabelTitle: String {
        receiveGenres()
    }

    override var seasonsLabelIsHidden: Bool {
        false
    }

    override var progressViewIsHidden: Bool {
        false
    }
}

extension WatchingNowCellViewModel {
    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres else { return "Unknown genre" }
        return genreNames.joined(separator: ", ")
    }
}

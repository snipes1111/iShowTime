//
//  WatchingNowCellViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

class WatchingNowCellViewModel: SeriesCellViewModel {

    override var genreLabel: String {
        receiveGenres()
    }

    override var seasonsLabelText: String {
        let numberOfSeasons = Int(series?.numberOfSeasons ?? 1)
        return "Seasons - \(numberOfSeasons)"
    }

    override var progressViewIsHidden: Bool {
        false
    }
}

extension WatchingNowCellViewModel {
    private func receiveGenres() -> String {
        let genres = series?.genres?.compactMap { $0.name }
        guard let genreNames = genres else { return "Unknown genre" }
        return genreNames.joined(separator: ", ")
    }
}

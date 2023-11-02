//
//  FavouriteCellViewModel.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import Foundation

class FavouriteCellViewModel: SeriesCellViewModel {
    override var genreLabel: String {
        receiveGenres()
    }
}

extension FavouriteCellViewModel {
    private func receiveGenres() -> String {
        let genres = series.genres?.compactMap { $0.name }
        guard let genreNames = genres else { return "Unknown genre" }
        return genreNames.joined(separator: ", ")
    }
}

//
//  FavouritesDetailViewModel.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import Foundation

final class FavouritesDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    private let dataStorage: DataStoreMangerProtocol = DataStoreManger.shared

    func fetchSeriesDetails() {
        let selectedSeries = dataStorage.favouriteSeriesList().filter { $0.id == seriesId }
        series = selectedSeries.first
        viewModelDidChange?(self)
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let series = series else { return nil }
        return SearchDetailCellViewModel(series: series)
    }
}

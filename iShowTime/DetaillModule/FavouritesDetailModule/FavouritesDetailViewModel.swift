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
        let selectedSeries = dataStorage.favouriteSeriesList().filter { $0.series.id == seriesId }
        seriesData = selectedSeries.first
        viewModelDidChange?(self)
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let seriesData = seriesData else { return nil }
        return SeriesDescriptionCellViewModel(seriesData: seriesData)
    }
}

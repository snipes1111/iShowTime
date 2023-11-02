//
//  WatchingNowDetailViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

final class WatchingNowDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    private let dataStorage: DataStoreMangerProtocol = DataStoreManger.shared

    func fetchSeriesDetails() {
        let selectedSeries = dataStorage.seriesList().filter { $0.series.id == seriesId }
        seriesData = selectedSeries.first
        viewModelDidChange?(self)
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let seriesData = seriesData else { return nil }
        return WatchingNowDetailCellViewModel(seriesData: seriesData)
    }
}

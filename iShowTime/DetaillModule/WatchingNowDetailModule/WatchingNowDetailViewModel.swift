//
//  WatchingNowDetailViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

final class WatchingNowDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    private let dataStorage: DataStoreManagerProtocol = DataStoreManger()

    func fetchSeriesDetails() {
        seriesData = dataStorage.getSeries(with: seriesId)
        viewModelDidChange?(self)
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let seriesData = seriesData else { return nil }
        return WatchingNowDetailCellViewModel(seriesData: seriesData)
    }
}

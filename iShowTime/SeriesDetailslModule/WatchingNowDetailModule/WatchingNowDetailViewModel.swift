//
//  WatchingNowDetailViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

final class WatchingNowDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    private let dataStorage: DataStoreManagerProtocol = DataStoreManger()

    var cellType: DetailCell.Type { WatchingNowDetailCell.self }

    func fetchSeriesDetails() {
        seriesData = dataStorage.getSeries(with: seriesId ?? 0)
        viewModelDidChange?(self)
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let seriesData = seriesData else { return nil }
        return WatchingNowDetailCellViewModel(seriesData: seriesData)
    }
}

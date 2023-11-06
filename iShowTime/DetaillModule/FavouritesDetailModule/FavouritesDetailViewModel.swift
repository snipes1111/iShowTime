//
//  FavouritesDetailViewModel.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import Foundation

final class FavouritesDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    private let dataStorage: DataStoreManagerProtocol = DataStoreManger.shared

    func fetchSeriesDetails() {
        seriesData = dataStorage.getSeries(with: seriesId)
        viewModelDidChange?(self)
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let seriesData = seriesData else { return nil }
        return SeriesDescriptionCellViewModel(seriesData: seriesData)
    }
}

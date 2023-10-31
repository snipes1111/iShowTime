//
//  FavouritesViewModel.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import Foundation

class FavouritesViewModel: SectionViewModel, SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    func fetchSeries(_ searchText: String?) {
        series = dataStoreManager.favouriteSeriesList()
        viewModelDidChange?(self)
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel {
        let seriesAtIndexPath = series[indexPath.item]
        return FavouriteCellViewModel(series: seriesAtIndexPath)
    }
}

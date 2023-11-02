//
//  WatchingNowViewModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation

final class WatchingNowViewModel: SectionViewModel, 
                                  SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    func fetchSeries() {
        seriesData = dataStoreManager.seriesList()
        viewModelDidChange?(self)
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel {
        let cellSeriesData = seriesData[indexPath.item]
        return WatchingNowCellViewModel(cellSeriesData: cellSeriesData)
    }
}

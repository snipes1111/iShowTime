//
//  WatchingNowViewModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation
import RealmSwift

final class WatchingNowViewModel: SectionViewModel,
                                  SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreManagerProtocol = DataStoreManger()

    var promptLabelText: String { Constants.Labels.watchingPrompt }
    
    func fetchSeries() {
        seriesData = Array(dataStoreManager.watchingSeriesList())
        viewModelDidChange?(self)
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel? {
        WatchingNowCellViewModel(cellSeriesData: seriesData[indexPath.item])
    }
}

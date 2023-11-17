//
//  FavouritesViewModel.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import Foundation
import RealmSwift

protocol EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath)
}

class FavouritesViewModel: SectionViewModel,
                           SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreManagerProtocol = DataStoreManger()

    var promptLabelText: String { Constants.Labels.favouritesPrompt }

    func fetchSeries() {
        seriesData = Array(dataStoreManager.favouriteSeriesList())
        viewModelDidChange?(self)
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel? {
        FavouriteCellViewModel(cellSeriesData: seriesData[indexPath.item])
    }

    func showDetails(at indexPath: IndexPath) {
        router.pushDetailViewController(seriesData: seriesData[indexPath.item])
    }
}

extension FavouritesViewModel: EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath) {
        dataStoreManager.setIsFavourite(seriesData: seriesData[indexPath.item], countries: "")
        fetchSeries()
    }
}

//
//  FavouritesViewModel.swift
//  iShowTime
//
//  Created by user on 31/10/2023.
//

import Foundation

protocol EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath)
}

class FavouritesViewModel: SectionViewModel, 
                           SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    override var promptLabelText: String { FavouritesConstants.promptLabel }

    func fetchSeries() {
        seriesData = dataStoreManager.favouriteSeriesList()
        viewModelDidChange?(self)
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel {
        let cellSeriesData = seriesData[indexPath.item]
        return FavouriteCellViewModel(cellSeriesData: cellSeriesData)
    }
}

extension FavouritesViewModel: EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath) {
        var cellSeriesData = seriesData[indexPath.item]
        cellSeriesData.isFavourite = false
        dataStoreManager.save(seriesData: cellSeriesData)
        fetchSeries()
    }
}

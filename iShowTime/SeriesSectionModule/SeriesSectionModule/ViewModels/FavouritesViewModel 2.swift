//
//  FavouritesViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 31/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation
import RealmSwift

final class FavouritesViewModel: SectionViewModel,
                           SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreManagerProtocol = DataStoreManger()

    var promptLabelText: String { Constants.Labels.favouritesPrompt }

    func fetchSeries() {
        seriesData = Array(dataStoreManager.favouriteSeriesList())
        viewModelDidChange?(self)
    }

    func showDetails(at indexPath: IndexPath) {
        router.pushDetailViewController(seriesData: seriesData[indexPath.item])
    }
}

extension FavouritesViewModel: EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath) {
        dataStoreManager.setIsFavourite(seriesData: seriesData[indexPath.item])
        fetchSeries()
    }
}

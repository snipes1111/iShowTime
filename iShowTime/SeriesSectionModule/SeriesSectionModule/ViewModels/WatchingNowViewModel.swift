//
//  WatchingNowViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 12/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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

    func showDetails(at indexPath: IndexPath) {
        router.pushProgressViewController(seriesData: seriesData[indexPath.item])
    }
}

extension WatchingNowViewModel: EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath) {
        dataStoreManager.setIsBeingWatched(seriesData: seriesData[indexPath.item])
        seriesData.remove(at: indexPath.item)
    }
}

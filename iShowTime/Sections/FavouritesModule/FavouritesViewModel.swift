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

class FavouritesViewModel: SectionViewModelProtocol, 
                           SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreManagerProtocol = DataStoreManger()

    var seriesData: Results<SeriesData>?
    private let router: RouterProtocol

    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)?
    var numberOfRows: Int { seriesData?.count ?? 0 }
    var heightForRow: Int { 165 }
    var promptLabelText: String { FavouritesConstants.promptLabel }
    var promptLabelIsHidden: Bool { !(seriesData?.isEmpty ?? true) }

    required init(router: RouterProtocol) {
        self.router = router
    }

    func showDetails(at indexPath: IndexPath) {
        guard let selectedSeries = seriesData?[indexPath.item] else { return }
        router.showDetailSeriesViewController(seriesData: selectedSeries)
    }

    func fetchSeries() {
        seriesData = dataStoreManager.favouriteSeriesList()
        viewModelDidChange?(self)
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel? {
        guard let cellSeriesData = seriesData?[indexPath.item] else { return nil }
        return FavouriteCellViewModel(cellSeriesData: cellSeriesData)
    }
}

extension FavouritesViewModel: EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath) {
        guard let cellSeriesData = seriesData?[indexPath.item] else { return }
        dataStoreManager.setIsFavourite(seriesData: cellSeriesData, countries: "")
        fetchSeries()
    }
}

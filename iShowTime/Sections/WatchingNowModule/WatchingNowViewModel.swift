//
//  WatchingNowViewModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation
import RealmSwift

final class WatchingNowViewModel: SectionViewModelProtocol,
                                  SectionViewModelRepresentableProtocol {

    private let dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    var seriesData: Results<SeriesData>?
    private let router: RouterProtocol

    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)?
    var numberOfRows: Int { seriesData?.count ?? 0 }
    var heightForRow: Int { 165 }
    var promptLabelText: String { WatchingNowConstants.promptLabel }
    var promptLabelIsHidden: Bool { !(seriesData?.isEmpty ?? true) }

    required init(router: RouterProtocol) {
        self.router = router
    }

    func showDetails(at indexPath: IndexPath) {
        guard let selectedSeries = seriesData?[indexPath.item],
              let id = selectedSeries.series.id,
              let seriesName = selectedSeries.series.name else { return }
        router.showDetailSeriesViewController(id, seriesName)
    }

    func fetchSeries() {
        seriesData = dataStoreManager.seriesList()
        viewModelDidChange?(self)
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel? {
        guard let cellSeriesData = seriesData?[indexPath.item] else { return nil }
        return WatchingNowCellViewModel(cellSeriesData: cellSeriesData)
    }
}

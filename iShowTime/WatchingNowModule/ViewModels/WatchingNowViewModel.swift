//
//  WatchingNowViewModel.swift
//  iShowTime
//
//  Created by user on 12/09/2023.
//

import Foundation

protocol WatchingNowViewModelProtocol {

    var viewModelDidChange: ((WatchingNowViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    init(router: RouterProtocol)
    func fetchSeries()
    func configureCell(_ watchingNowCell: WatchingNowSeriesCell, _ indexPath: IndexPath)
    func showDetails(at indexPath: IndexPath)
}

class WatchingNowViewModel: WatchingNowViewModelProtocol {

    private let dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared
    private let router: RouterProtocol
    private var series = [Series]()

    var viewModelDidChange: ((WatchingNowViewModelProtocol) -> Void)?
    var numberOfRows: Int { series.count }
    var heightForRow: Int { 165 }

    private var countries: [Country]?

    var numberOfSeries: Int {
        series.count
    }

    required init(router: RouterProtocol) {
        self.router = router
    }

    func fetchSeries() {
        series = dataStoreManager.seriesList()
        viewModelDidChange?(self)
    }

    func configureCell(_ watchingNowCell: WatchingNowSeriesCell, _ indexPath: IndexPath) {
        let seriesAtIndexPath = series[indexPath.item]
        let viewModel = WatchingNowCellViewModel(series: seriesAtIndexPath)
        watchingNowCell.viewModel = viewModel
    }

    func showDetails(at indexPath: IndexPath) {
        let series = series[indexPath.item]
        guard let id = series.id,
        let seriesName = series.name else { return }
        router.showWatchingNowDetailViewController(id, seriesName)
    }
}

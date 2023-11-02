//
//  SectionViewModel.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import Foundation

enum CellType {
    case search, watchingNow, favourite
}


protocol SectionViewModelProtocol {
    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    var promptLabelText: String { get }
    var promptLabelIsHidden: Bool { get }
    init(router: RouterProtocol)
    func showDetails(at indexPath: IndexPath)
}

protocol SectionViewModelRepresentableProtocol {
    func fetchSeries()
    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel
}

class SectionViewModel: SectionViewModelProtocol {
    var seriesData: [SeriesData] = []
    private let router: RouterProtocol

    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)?
    var numberOfRows: Int { seriesData.count }
    var heightForRow: Int { 165 }
    var promptLabelText: String { WatchingNowConstants.promptLabel }
    var promptLabelIsHidden: Bool { seriesData.isEmpty ? false : true }

    required init(router: RouterProtocol) {
        self.router = router
    }

    func showDetails(at indexPath: IndexPath) {
        let selectedSeries = seriesData[indexPath.item]
        guard let id = selectedSeries.series.id,
              let seriesName = selectedSeries.series.name else { return }
        router.showDetailSeriesViewController(id, seriesName)
    }
}

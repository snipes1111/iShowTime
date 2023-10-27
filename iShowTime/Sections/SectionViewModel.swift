//
//  SectionViewModel.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import Foundation

protocol SectionViewModelProtocol {
    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    init(router: RouterProtocol)
    func showDetails(at indexPath: IndexPath)
}

protocol SectionViewModelRepresentableProtocol {
    func fetchSeries(_ searchText: String?)
    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel
}

class SectionViewModel: SectionViewModelProtocol {
    var series: [Series] = []
    var router: RouterProtocol

    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)?
    var numberOfRows: Int { series.count }
    var heightForRow: Int { 165 }

    required init(router: RouterProtocol) {
        self.router = router
    }

    func showDetails(at indexPath: IndexPath) {
        let series = series[indexPath.item]
        guard let id = series.id,
        let seriesName = series.name else { return }
        router.showDetailSeriesViewController(id, seriesName)
    }
}

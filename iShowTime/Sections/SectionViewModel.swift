//
//  SectionViewModel.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import Foundation

protocol SectionViewModelProtocol {
    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    init(router: RouterProtocol)
    func showDetails(at indexPath: IndexPath)
}

protocol SectionViewModelRepresentableProtocol {
    func fetchSeries(_ searchText: String?)
    func configureCell(_ searchCell: SearchSeriesCell, _ indexPath: IndexPath)
}

class SectionViewModel: SectionViewModelProtocol {
    private var series: [Series] = []
    private var router: RouterProtocol

    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)?
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

//
//  SeriesDetailViewModel.swift
//  iShowTime
//
//  Created by user on 23/10/2023.
//

import Foundation

protocol SeriesDetailViewModelProtocol {
    var viewModelDidChange: ((SeriesDetailViewModelProtocol) -> Void)? { get set }
    var backDropImageUrl: String? { get }
    var numberOfRows: Int { get }
    init(seriesId: Double)
    func fetchSeriesDetails()
    func returnDetailCellViewModel() -> DetailCellViewModelProtocol?
}

class SeriesDetailViewModel: SeriesDetailViewModelProtocol {
    var seriesId: Double
    var series: Series?

    var viewModelDidChange: ((SeriesDetailViewModelProtocol) -> Void)?
    var backDropImageUrl: String? { series?.backdropPath }
    var numberOfRows: Int { 1 }

    required init(seriesId: Double) {
        self.seriesId = seriesId
    }

    func fetchSeriesDetails() {}
    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        return nil
    }
}

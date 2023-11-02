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
}

protocol SeriesDetailRepresentableProtocol {
    func fetchSeriesDetails()
    func returnDetailCellViewModel() -> DetailCellViewModelProtocol?
}

class SeriesDetailViewModel: SeriesDetailViewModelProtocol {
    let seriesId: Double
    var seriesData: SeriesData?
    var series: Series? { seriesData?.series }

    var viewModelDidChange: ((SeriesDetailViewModelProtocol) -> Void)?
    var backDropImageUrl: String? { series?.backdropPath }
    var numberOfRows: Int { 1 }

    required init(seriesId: Double) {
        self.seriesId = seriesId
    }
}

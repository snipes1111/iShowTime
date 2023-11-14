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
    init(seriesData: SeriesData)
}

protocol SeriesDetailRepresentableProtocol {
    func fetchSeriesDetails()
    func returnDetailCellViewModel() -> DetailCellViewModelProtocol?
}

class SeriesDetailViewModel: SeriesDetailViewModelProtocol {
    let seriesId: Double?
    let countries: String
    var seriesData: SeriesData?
    var series: Series? { seriesData?.series }

    var viewModelDidChange: ((SeriesDetailViewModelProtocol) -> Void)?
    var backDropImageUrl: String? { series?.backdropPath }
    var numberOfRows: Int { 1 }

    required init(seriesData: SeriesData) {
        self.seriesId = seriesData.series.id
        self.countries = seriesData.originCountry
    }
}

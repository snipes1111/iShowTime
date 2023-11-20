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
    var tableViewTopInset: Int { get }
    init(seriesData: SeriesData)
}

protocol SeriesDetailRepresentableProtocol {
    var cellType: DetailCell.Type { get }
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
    var tableViewTopInset: Int { 0 }

    required init(seriesData: SeriesData) {
        self.seriesId = seriesData.series?.id
        self.countries = seriesData.originCountry
    }
}

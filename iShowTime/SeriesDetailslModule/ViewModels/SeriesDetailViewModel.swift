//
//  SeriesDetailViewModel.swift
//  iShowTime
//
//  Created by user on 23/10/2023.
//

import Foundation

protocol SeriesDetailViewModelProtocol {
    var viewModelDidChange: ((SeriesDetailViewModelProtocol?) -> Void)? { get set }
    var backDropImageUrl: String? { get }
    var numberOfRows: Int { get }
    var tableViewTopInset: Int { get }
    init(seriesData: SeriesData)
    func fetchSeriesDetails()
}

protocol SeriesDetailRepresentableProtocol {
    var cellType: DetailCell.Type { get }
    func returnDetailCellViewModel() -> DetailCellViewModelProtocol?
}

protocol CellResizable: AnyObject {
    func resizeCell()
}


class SeriesDetailViewModel: SeriesDetailViewModelProtocol {

    private let dataStorage: DataStoreManagerProtocol = DataStoreManger()

    var seriesData: SeriesData

    var viewModelDidChange: ((SeriesDetailViewModelProtocol?) -> Void)?
    var backDropImageUrl: String? { seriesData.series?.backdropPath }
    var numberOfRows: Int { 1 }
    var tableViewTopInset: Int { 0 }

    required init(seriesData: SeriesData) {
        self.seriesData = seriesData
    }

    func fetchSeriesDetails() {
        guard let id = seriesData.series?.id else { return }
        if let seriesFromStorage = dataStorage.getSeries(with: id) {
            seriesData = seriesFromStorage
        }
        viewModelDidChange?(nil)
    }
}

extension SeriesDetailViewModel: CellResizable {
    func resizeCell() {
        viewModelDidChange?(nil)
    }
}

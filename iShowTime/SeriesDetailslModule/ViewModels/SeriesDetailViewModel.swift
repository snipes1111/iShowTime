//
//  SeriesDetailViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 23/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

protocol SeriesDetailViewModelProtocol {
    var viewModelDidChange: ((SeriesDetailViewModelProtocol?) -> Void)? { get set }
    var backDropImageUrl: String? { get }
    var backDropImageData: Data? { get }
    var numberOfRows: Int { get }
    var tableViewTopInset: Int { get }
    var cellType: DetailCell.Type { get }
    init(seriesData: SeriesData)
    func fetchSeriesDetails()
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
    var backDropImageData: Data? { seriesData.backDropImageData }
    var numberOfRows: Int { 1 }
    var tableViewTopInset: Int { 0 }
    var cellType: DetailCell.Type { SeriesDescriptionCell.self }

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

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        let viewModel = SeriesDescriptionCellViewModel(seriesData: seriesData)
        viewModel.delegate = self
        return viewModel
    }
}

extension SeriesDetailViewModel: CellResizable {
    func resizeCell() {
        viewModelDidChange?(nil)
    }
}

//
//  BaseDetailCellViewModel.swift
//  iShowTime
//
//  Created by user on 23/10/2023.
//

import Foundation

protocol DetailCellViewModelProtocol {
    var seriesName: String { get }
    var imageUrl: String? { get }
    var seriesIsSaved: Bool { get }
    init(series: Series)
    func watchingNowButtonPressed()
}

class DetailCellViewModel: DetailCellViewModelProtocol {

    var series: Series
    private var dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    var seriesName: String { series.name ?? SearchModuleConstants.unknownTitle }
    var imageUrl: String? { series.posterPath }
    var seriesIsSaved: Bool { dataStoreManager.isSavedBefore(series: series) }

    required init(series: Series) {
        self.series = series
    }

    func watchingNowButtonPressed() {
        if !seriesIsSaved {
            dataStoreManager.save(series: series)
        } else {
            dataStoreManager.remove(series: series)
        }
    }
}

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
    var isSaved: Bool { get }
    init(seriesData: SeriesData)
    func watchingNowButtonPressed()
}

class DetailCellViewModel: DetailCellViewModelProtocol {

    private(set) var seriesData: SeriesData
    private(set) var series: Series
    
    let dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared


    var seriesName: String { series.name ?? SearchModuleConstants.unknownTitle }
    var imageUrl: String? { series.posterPath }
    var isSaved: Bool { dataStoreManager.isSavedBefore(seriesData: seriesData) }

    required init(seriesData: SeriesData) {
        self.seriesData = seriesData
        self.series = seriesData.series
    }

    func setIsFavourite(isFavourite: Bool) {
        seriesData.isFavourite = isFavourite
    }

    func watchingNowButtonPressed() {
        if !isSaved {
            dataStoreManager.save(seriesData: seriesData)
        } else {
            dataStoreManager.remove(seriesData: seriesData)
        }
    }
}

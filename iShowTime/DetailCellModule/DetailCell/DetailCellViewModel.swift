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
    var isBeingWatched: Bool { get }
    init(seriesData: SeriesData)
    func watchingNowButtonPressed()
}

class DetailCellViewModel: DetailCellViewModelProtocol {

    private(set) var seriesData: SeriesData
    private(set) var series: Series
    
    let dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared


    var seriesName: String { series.name ?? SearchModuleConstants.unknownTitle }
    var imageUrl: String? { series.posterPath }
    var isBeingWatched: Bool { seriesData.isBeingWatched }

    required init(seriesData: SeriesData) {
        self.seriesData = seriesData
        self.series = seriesData.series
    }

    func setIsFavourite(isFavourite: Bool) {
        seriesData.isFavourite = isFavourite
        dataStoreManager.save(seriesData: seriesData)
    }

    func setSeason(season: Double) {
        seriesData.currentSeason = season
        dataStoreManager.save(seriesData: seriesData)
    }

    func setEpisode(episode: Double) {
        seriesData.currentEpisode = episode
        dataStoreManager.save(seriesData: seriesData)
    }

    func setProgress(progress: Float) {
        seriesData.currentProgress = progress
        dataStoreManager.save(seriesData: seriesData)
    }

    func watchingNowButtonPressed() {
        seriesData.isBeingWatched.toggle()
        dataStoreManager.save(seriesData: seriesData)
    }
}

//
//  WatchingNowDetailViewCellViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

protocol WatchingNowDetailViewCellViewModelProtocol {
    var seriesName: String { get }
    var description: String { get }
    var nextEpisodeDate: String { get }
    var season: String { get }
    var episode: String { get }
    var seasonTFText: String { get }
    var episodeTFText: String { get }
    var seriesProgress: Float { get }
    var imageUrl: String? { get }
    var seriesIsSaved: Bool { get }
    init(series: Series)
    func watchingNowButtonPressed()
}

final class WatchingNowDetailViewCellViewModel: WatchingNowDetailViewCellViewModelProtocol {

    private var series: Series
    private var dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    private var seasonCount: Double = 1
    private var episodeCount: Double = 1

    var seriesName: String { series.name ?? SearchModuleConstants.unknownTitle }

    var description: String {
        let numberOfSeasons = Int(series.numberOfSeasons ?? 1)
        let productionStatus = (series.inProduction ?? false) ? "In Production" : "Finished"
        return "Seasons: \(numberOfSeasons) • Status: \(productionStatus)"
    }

    var nextEpisodeDate: String {
        "Next Episode Air Date \(series.nextEpisodeToAir?.airDate ?? "No info")"
    }

    var season: String { "Season" }
    var episode: String { "Episode" }

    var seasonTFText: String { "\(seasonCount)" }
    var episodeTFText: String { "\(episodeCount)" }

    var seriesProgress: Float { calculateSeriesProgress() }

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

extension WatchingNowDetailViewCellViewModel {
    func calculateSeriesProgress() -> Float {
        guard let numberOfSeries = series.numberOfEpisodes else { return 1 }
        let numberOfSeasons = series.numberOfSeasons ?? 1
        let seriesInSeason = (numberOfSeries / numberOfSeasons).rounded(.up)
        let totalProgress = (episodeCount + (seasonCount - 1) * seriesInSeason) / numberOfSeries
        return Float(totalProgress)
    }
}

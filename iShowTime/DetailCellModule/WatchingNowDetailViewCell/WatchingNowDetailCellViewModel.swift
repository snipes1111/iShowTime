//
//  WatchingNowDetailViewCellViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

enum CounterType {
    case season, episode
}

protocol WatchingNowDetailCellViewModelProtocol {
    var description: String { get }
    var nextEpisodeDate: String { get }
    var season: String { get }
    var episode: String { get }
    var seasonTFText: String { get }
    var episodeTFText: String { get }
    var seriesProgress: Float { get }
    func increment(_ counterType: CounterType)
    func decrement(_ counterType: CounterType)
}

final class WatchingNowDetailCellViewModel: DetailCellViewModel, WatchingNowDetailCellViewModelProtocol {

    private var dataStoreManager: DataStoreMangerProtocol = DataStoreManger.shared

    private var seasonCount: Double = 1
    private var episodeCount: Double = 1

    private var numberOfSeasons: Double { series.numberOfSeasons ?? 1 }

    var description: String {
        let productionStatus = (series.inProduction ?? false) ? "In Production" : "Finished"
        return "Seasons: \(Int(numberOfSeasons)) • Status: \(productionStatus)"
    }

    var nextEpisodeDate: String {
        let airDate = series.nextEpisodeToAir?.airDate.extractDate()
        return "Next Episode Air Date: \(airDate ?? "No info")"
    }

    var season: String { "Season" }
    var episode: String { "Episode" }

    var seasonTFText: String { "\(Int(seasonCount))" }
    var episodeTFText: String { "\(Int(episodeCount))" }

    var seriesProgress: Float { calculateSeriesProgress() }

    func increment(_ counterType: CounterType) {
        if counterType == .episode {
            episodeCount += 1
        } else {
            guard seasonCount <= numberOfSeasons else { return }
            seasonCount += 1
        }
    }

    func decrement(_ counterType: CounterType) {
        if counterType == .episode {
            guard episodeCount > 1 else { return }
            episodeCount -= 1
        } else {
            guard seasonCount > 1 else { return }
            seasonCount -= 1
        }
    }
}

extension WatchingNowDetailCellViewModel {
    func calculateSeriesProgress() -> Float {
        guard let numberOfSeries = series.numberOfEpisodes else { return 1 }
        let seriesInSeason = (numberOfSeries / numberOfSeasons).rounded(.up)
        let totalProgress = (episodeCount + (seasonCount - 1) * seriesInSeason) / numberOfSeries
        return Float(totalProgress)
    }
}

//
//  WatchingNowDetailCellViewModel.swift
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
    var seasonText: String { get }
    var episodeText: String { get }
    var seasonTFText: String { get }
    var episodeTFText: String { get }
    var seriesProgress: Float { get }
    func increment(_ counterType: CounterType)
    func decrement(_ counterType: CounterType)
    func setSeasonCount(_ text: String?)
    func setEpisodeCount(_ text: String?)
}

final class WatchingNowDetailCellViewModel: DetailCellViewModel, WatchingNowDetailCellViewModelProtocol {

    private var numberOfSeasons: Double { series.numberOfSeasons ?? 1 }
    private var numberOfEpisodes: Double { series.numberOfEpisodes ?? 1 }
    private var episodesInSeason: Double { getEpisodesInSeason(seasonCount) ?? 1 }

    private var seasonCount: Double = 1 {
        didSet {
            episodeCount = 0
            setSeason(season: seasonCount)
        }
    }
    private var episodeCount: Double = 0 {
        didSet {
            setEpisode(episode: episodeCount)
        }
    }

    var description: String {
        let productionStatus = (series.inProduction ?? false) ?
        WatchingNowConstants.inProduction : WatchingNowConstants.finished
        let seasons = WatchingNowConstants.seasons, status = WatchingNowConstants.status
        return seasons + "\(Int(numberOfSeasons))" + status + "\(productionStatus)"
    }

    var nextEpisodeDate: String {
        let airDate = series.nextEpisodeToAir?.airDate.extractDate() ?? WatchingNowConstants.noInfo
        return WatchingNowConstants.nextEpisode + "\(airDate)"
    }

    var seasonText: String { WatchingNowConstants.season }
    var episodeText: String { WatchingNowConstants.episode }

    var seasonTFText: String { "\(Int(seasonCount))" }
    var episodeTFText: String { "\(Int(episodeCount))" }

    var seriesProgress: Float = 0 {
        didSet {
            setProgress(progress: seriesProgress)
        }
    }

    func increment(_ counterType: CounterType) {
        if counterType == .episode {
            guard episodeCount < episodesInSeason else { return }
            episodeCount += 1
        } else {
            guard seasonCount < numberOfSeasons else { return }
            seasonCount += 1
        }
        calculateSeriesProgress()
    }

    func decrement(_ counterType: CounterType) {
        if counterType == .episode {
            guard episodeCount > 0 else { return }
            episodeCount -= 1
        } else {
            guard seasonCount > 1 else { return }
            seasonCount -= 1
        }
        calculateSeriesProgress()
    }

    func setSeasonCount(_ text: String?) {
        guard let counter = Double(text ?? ""), counter > 0 else { return }
        if counter <= numberOfSeasons {
            seasonCount = counter
        } else {
            seasonCount = numberOfSeasons
        }
        calculateSeriesProgress()
    }

    func setEpisodeCount(_ text: String?) {
        guard let counter = Double(text ?? ""), counter >= 0 else { return }
        if counter <= episodesInSeason {
            episodeCount = counter
        } else {
            episodeCount = episodesInSeason
        }
        calculateSeriesProgress()
    }
}

extension WatchingNowDetailCellViewModel {

    private func getEpisodesInSeason(_ season: Double) -> Double? {
        let currentSeason = series.seasons?.first { $0.seasonNumber == season }
        return currentSeason?.episodeCount
    }

    private func calculateSeriesProgress() {
        let seriesWatched = getEpisodesCount()
        let totalProgress = (seriesWatched + episodeCount) / numberOfEpisodes
        seriesProgress = Float(totalProgress)
    }

    private func getEpisodesCount() -> Double {
        guard seasonCount > 1 else { return 0 }
        let seasons = seasonsWatched()
        return seasons.compactMap { $0.episodeCount }.reduce(0, +)
    }

    private func seasonsWatched() -> [Series.Season] {
        let watchedSeasonsWithoutSpecialSeasons = series.seasons?.filter { season in
            if let seasonNumber = season.seasonNumber,
                seasonNumber != 0 && seasonNumber < seasonCount {
                return true
            }
            return false
        }
        return watchedSeasonsWithoutSpecialSeasons ?? []
    }
}

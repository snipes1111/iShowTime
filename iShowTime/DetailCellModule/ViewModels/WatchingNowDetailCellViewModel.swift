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

    private var numberOfSeasons: Double { seriesData.series?.numberOfSeasons ?? 1 }
    private var numberOfEpisodes: Double { seriesData.series?.numberOfEpisodes ?? 1 }
    private var episodesInSeason: Double { getEpisodesInSeason(seasonCount) ?? 1 }

    private var seasonCount: Double {
        get {
            seriesData.currentSeason
        } set {
            setProgress(seriesProgress: SeriesProgress(season: newValue,
                                                       episode: 0,
                                                       progress: seriesProgress))
        }
    }
    private var episodeCount: Double {
        get {
            seriesData.currentEpisode
        } set {
            setProgress(seriesProgress: SeriesProgress(season: seasonCount,
                                                       episode: newValue,
                                                       progress: seriesProgress))
        }
    }

    var description: String {
        let productionStatus = (seriesData.series?.inProduction ?? false) ?
        Constants.SeriesInfo.inProduction : Constants.SeriesInfo.finished
        let seasons = Constants.SeriesInfo.seasons, divider = Constants.SeriesInfo.divider
        return seasons + "\(Int(numberOfSeasons))" + divider + productionStatus
    }

    var nextEpisodeDate: String {
        let airDate = seriesData.series?.nextEpisodeToAir?.airDate.extractDate()
        return Constants.SeriesInfo.nextEpisode + (airDate ?? Constants.SeriesInfo.noInfo)
    }

    var seasonText: String { Constants.SeriesInfo.season }
    var episodeText: String { Constants.SeriesInfo.episode }

    var seasonTFText: String { "\(Int(seasonCount))" }
    var episodeTFText: String { "\(Int(episodeCount))" }

    var seriesProgress: Float {
        get {
            seriesData.currentProgress
        } set {
            setProgress(seriesProgress: SeriesProgress(season: seasonCount,
                                                       episode: episodeCount,
                                                       progress: newValue))
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
        let currentSeason = seriesData.series?.seasons?.first { $0.seasonNumber == season }
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
        let watchedSeasonsWithoutSpecialSeasons = seriesData.series?.seasons?.filter { season in
            if let seasonNumber = season.seasonNumber,
                seasonNumber != 0 && seasonNumber < seasonCount {
                return true
            }
            return false
        }
        return watchedSeasonsWithoutSpecialSeasons ?? []
    }
}

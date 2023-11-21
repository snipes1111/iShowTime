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
    
    private var episodesInSeason: Double {
        let currentSeason = seriesData.series?.seasons?.first { $0.seasonNumber == seasonCount }
        return currentSeason?.episodeCount ?? 1
    }

    private lazy var seasonCount: Double = seriesData.currentSeason
    private lazy var episodeCount: Double = seriesData.currentEpisode
    lazy var seriesProgress: Float = seriesData.currentProgress

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

    private func calculateSeriesProgress() {
        let seriesWatched = seriesWatchedCount()
        let totalProgress = (seriesWatched + episodeCount) / numberOfEpisodes
        seriesProgress = Float(totalProgress)
        let progress = SeriesProgress(season: seasonCount, episode: episodeCount, progress: seriesProgress)
        setProgress(seriesProgress: progress)
    }

    private func seriesWatchedCount() -> Double {
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

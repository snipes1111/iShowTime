//
//  SeriesProgressManager.swift
//  iShowTime
//
//  Created by user on 22/11/2023.
//

import Foundation

struct SeriesProgressManager {

    let seriesData: SeriesData
    let season: Double
    let episode: Double
    private var numberOfEpisodes: Double { seriesData.series?.numberOfEpisodes ?? 1 }

    init(seriesData: SeriesData, season: Double, episode: Double) {
        self.seriesData = seriesData
        self.season = season
        self.episode = episode
    }

    func calculateProgress() -> Float {
        let seriesWatched = seriesWatchedCount()
        let totalProgress = (seriesWatched + episode) / numberOfEpisodes
        return Float(totalProgress)
    }

    func currentProgress() -> SeriesProgress {
        SeriesProgress(season: season, episode: episode, progress: calculateProgress())
    }

    private func seriesWatchedCount() -> Double {
        guard season > 1 else { return 0 }
        let seasons = seasonsWatched()
        return seasons.compactMap { $0.episodeCount }.reduce(0, +)
    }

    private func seasonsWatched() -> [Series.Season] {
        let watchedSeasonsWithoutSpecials = seriesData.series?.seasons?.filter { eachSeason in
            if let seasonNumber = eachSeason.seasonNumber,
               seasonNumber != 0 && seasonNumber < season {
                return true
            }
            return false
        }
        return watchedSeasonsWithoutSpecials ?? []
    }

}

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
        let currentSeason = seriesData.series?.seasons?.first { $0.seasonNumber == seasonCounter }
        return currentSeason?.episodeCount ?? 1
    }

    private lazy var seasonCounter: Double = seriesData.currentSeason
    private lazy var episodeCounter: Double = seriesData.currentEpisode
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

    var seasonTFText: String { "\(Int(seasonCounter))" }
    var episodeTFText: String { "\(Int(episodeCounter))" }



    func increment(_ counterType: CounterType) {
        if counterType == .episode {
            guard episodeCounter < episodesInSeason else { return }
            episodeCounter += 1
        } else {
            guard seasonCounter < numberOfSeasons else { return }
            seasonCounter += 1
        }
        saveProgress()
    }

    func decrement(_ counterType: CounterType) {
        if counterType == .episode {
            guard episodeCounter > 0 else { return }
            episodeCounter -= 1
        } else {
            guard seasonCounter > 1 else { return }
            seasonCounter -= 1
        }
        saveProgress()
    }

    func setSeasonCount(_ text: String?) {
        guard let counter = Double(text ?? ""), counter > 0 else { return }
        if counter <= numberOfSeasons {
            seasonCounter = counter
        } else {
            seasonCounter = numberOfSeasons
        }
        saveProgress()
    }

    func setEpisodeCount(_ text: String?) {
        guard let counter = Double(text ?? ""), counter >= 0 else { return }
        if counter <= episodesInSeason {
            episodeCounter = counter
        } else {
            episodeCounter = episodesInSeason
        }
        saveProgress()
    }
}

extension WatchingNowDetailCellViewModel {

    private func saveProgress() {
        let progressManager = SeriesProgressManager(seriesData: seriesData,
                                                    season: seasonCounter, episode: episodeCounter)
        seriesProgress = progressManager.calculateProgress()
        setProgress(seriesProgress: progressManager.currentProgress())
    }
}

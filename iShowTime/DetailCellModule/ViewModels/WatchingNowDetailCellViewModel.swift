//
//  WatchingNowDetailCellViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 19/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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
    var progress: Float { get }
    func increment(_ counterType: CounterType)
    func decrement(_ counterType: CounterType)
    func setCount(_ text: String?, _ counterType: CounterType)
}

final class WatchingNowDetailCellViewModel: DetailCellViewModel, WatchingNowDetailCellViewModelProtocol {

    private var numberOfSeasons: Double { seriesData.series?.numberOfSeasons ?? 1 }
    
    private var episodesInSeason: Double {
        let currentSeason = seriesData.series?.seasons?.first { $0.seasonNumber == seasonCounter }
        return currentSeason?.episodeCount ?? 1
    }

    private lazy var seasonCounter: Double = seriesData.currentSeason {
        didSet {
            validateSeason()
            episodeCounter = 0
            saveProgress()
        }
    }
    private lazy var episodeCounter: Double = seriesData.currentEpisode {
        didSet {
            validateEpisode()
            saveProgress()
        }
    }
    private lazy var seriesProgress: Float = seriesData.currentProgress

    var description: String {
        let inProduction = seriesData.series?.inProduction ?? false
        let status = inProduction ? SeriesConstants.inProduction : SeriesConstants.finished
        let seasons = SeriesConstants.seasons, divider = SeriesConstants.divider
        return seasons + "\(Int(numberOfSeasons))" + divider + status
    }

    var nextEpisodeDate: String {
        let airDate = seriesData.series?.nextEpisodeToAir?.airDate.extractDate()
        return SeriesConstants.nextEpisode + (airDate ?? SeriesConstants.noInfo)
    }

    var seasonText: String { SeriesConstants.season }
    var episodeText: String { SeriesConstants.episode }

    var seasonTFText: String { "\(Int(seasonCounter))" }
    var episodeTFText: String { "\(Int(episodeCounter))" }
    var progress: Float { seriesProgress }

    func increment(_ counterType: CounterType) {
        if counterType == .episode { episodeCounter += 1 }
        else { seasonCounter += 1 }
    }

    func decrement(_ counterType: CounterType) {
        if counterType == .episode { episodeCounter -= 1 }
        else { seasonCounter -= 1 }
    }

    func setCount(_ text: String?, _ counterType: CounterType) {
        guard let counter = Double(text ?? "") else { return }
        if counterType == .season { seasonCounter = counter }
        else { episodeCounter = counter }
    }
}

extension WatchingNowDetailCellViewModel {

    private func saveProgress() {
        let progressManager = SeriesProgressManager(seriesData: seriesData,
                                                    season: seasonCounter, episode: episodeCounter)
        seriesProgress = progressManager.calculateProgress()
        setProgress(seriesProgress: progressManager.currentProgress())
    }

    private func validateSeason() {
        if seasonCounter > numberOfSeasons { seasonCounter = numberOfSeasons }
        else if seasonCounter < 1 { seasonCounter = 1 }
    }

    private func validateEpisode() {
        if episodeCounter > episodesInSeason { episodeCounter = episodesInSeason }
        else if episodeCounter < 0 { episodeCounter = 0 }
    }
}

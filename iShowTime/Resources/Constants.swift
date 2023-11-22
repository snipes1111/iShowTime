//
//  Constants.swift
//  iShowTime
//
//  Created by user on 08/11/2023.
//

import UIKit

typealias SeriesConstants = Constants.SeriesInfo

struct Constants {
    struct Buttons {
        static let showMore = "Show more ..."
        static let addToWatching = "Add to Watching Now"
        static let removeFromWatching = "Remove from Watching Now"
    }
    struct Labels {
        static let initialPrompt = "Explore your new experience"
        static let isLoadingPrompt = "Searching for results..."
        static let finishedPrompt = "Nothing was found. Please, check your request or connection."
        static let watchingPrompt = "Add the series to track your progress"
        static let favouritesPrompt = "Series you wanted to watch will appear here"
        static let unknownCountry = "Unknown country"
    }
    struct SectionTitle {
        static let search = "Search"
        static let watchingNow = "Watching Now"
        static let favourites = "Favourites"
    }
    struct SeriesInfo {
        static let inProduction = "Status: In Production"
        static let finished = "Status: Finished"
        static let rating = "Rating MovieDB: "
        static let overview = "   Overview: "
        static let seasons = "Seasons: "
        static let unknownTitle = "Unknown name"
        static let noOverview = "No any overview yet"
        static let noGenre = "Unknown genre"
        static let noDate = "Unknown date"
        static let noRating = "No rating"
        static let divider = " • "
        static let nextEpisode = "Next Episode Air Date: "
        static let noInfo = "No info"
        static let season = "Season"
        static let episode = "Episode"
    }
}

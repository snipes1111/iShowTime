//
//  SearchSeriesViewModel.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 20/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

enum LoadingState {
    case initial
    case loading
    case finished
}

protocol SearchSeriesViewModelProtocol {
    var loadingState: Box<LoadingState> { get }
    func setSearchText(_ searchText: String?)
}

final class SearchSeriesViewModel: SectionViewModel, SearchSeriesViewModelProtocol {

    private let seriesFetcher: SeriesFetcherProtocol = SeriesFetcher()

    private var currentTask: Task<Void, Error>?
    private var searchText: String?

    var loadingState: Box<LoadingState> = Box(value: LoadingState.initial)

    func setSearchText(_ searchText: String?) {
        self.searchText = searchText
        fetchSeries()
    }
}

extension SearchSeriesViewModel: SectionViewModelRepresentableProtocol {
    var promptLabelText: String {
        switch loadingState.value {
        case .initial: return Constants.Labels.initialPrompt
        case .loading: return Constants.Labels.isLoadingPrompt
        case .finished: return Constants.Labels.finishedPrompt
        }
    }

    func fetchSeries() {
        prepareForSearch()
        loadingState.value = .initial
        if searchTextIsValid() { startLoading() }
    }

    func showDetails(at indexPath: IndexPath) {
        router.showDetailViewController(seriesData: seriesData[indexPath.item])
    }
}

extension SearchSeriesViewModel {

    private func prepareForSearch() {
        seriesData.removeAll()
        currentTask?.cancel()
    }

    private func searchTextIsValid() -> Bool {
        if let text = searchText, !text.isEmpty { return true }
        return false
    }

    private func startLoading() {
        loadingState.value = .loading
        guard let searchText = searchText else { return }
        let task = createLoadingTask(searchText)
        currentTask = task
    }
    // Delay task to prevent instant search while typing
    private func createLoadingTask(_ searchText: String) -> Task<Void, Error> {
        Task.delayed(byTimeInterval: 1.5) { [unowned self] in
            seriesData = await seriesFetcher.fetchAndDecodeData(searchText)
            loadingState.value = .finished
            viewModelDidChange?(self)
        }
    }
}

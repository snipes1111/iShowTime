//
//  SearchSeriesViewModel.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
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

final class SearchSeriesViewModel: SectionViewModel,
                                   SectionViewModelRepresentableProtocol & SearchSeriesViewModelProtocol {
    private let networkManager: NetworkServiceProtocol = NetworkService()
    private let errorHandler = ErrorHandler()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()
    private let countryService: CountryService = CountryService.shared
    private var currentTask: Task<Void, Error>?
    private var countries: [Country]?
    private var searchText: String?

    override var promptLabelText: String {
        setPromptLabelText()
    }

    var loadingState: Box<LoadingState> = Box(value: LoadingState.initial)

    func fetchSeries() {
        seriesData.removeAll()
        currentTask?.cancel()
        guard let searchText = searchText, !searchText.isEmpty else {
            loadingState.value = .initial
            return
        }
        loadingState.value = .loading
        let task = startLoadingTask(searchText)
        currentTask = task
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel {
        let cellSeriesData = seriesData[indexPath.item]
        return SeriesCellViewModel(cellSeriesData: cellSeriesData)
    }

    func setSearchText(_ searchText: String?) {
        self.searchText = searchText
        fetchSeries()
    }
}

extension SearchSeriesViewModel {

    private func startLoadingTask(_ searchText: String) -> Task<Void, Error> {
        Task.delayed(byTimeInterval: 1.5) { [unowned self] in
            await fetchAndDecodeData(searchText)
            loadingState.value = .finished
            viewModelDidChange?(self)
        }
    }

    private func fetchAndDecodeData(_ searchText: String) async {
        do {
            let seriesJSON = try await networkManager.fetchSeriesData(searchText)
            let countriesData = try await networkManager.fetchCountryList()
            guard let series = decoder.decodeSeriesFromData(seriesJSON) else { return }
            seriesData = series.map { SeriesData(series: $0) }
            guard let countries = decoder.decodeCountryList(countriesData) else { return }
            countryService.updateCountryList(with: countries)
        } catch {
            errorHandler.handle(error)
        }
    }

    private func setPromptLabelText() -> String {
        switch loadingState.value {
        case .initial: return SearchModuleConstants.welcomeText
        case .loading: return SearchModuleConstants.isLoading
        case .finished: return SearchModuleConstants.finishedWithNoResults
        }
    }
}

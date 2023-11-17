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

final class SearchSeriesViewModel: SectionViewModel, SearchSeriesViewModelProtocol {
    private let networkService: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()
    private let countryService = CountryService()
    
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

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel? {
        SeriesCellViewModel(cellSeriesData: seriesData[indexPath.item])
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
        let task = createLoadingTask(searchText!)
        currentTask = task
    }

    private func createLoadingTask(_ searchText: String) -> Task<Void, Error> {
        Task.delayed(byTimeInterval: 1.5) { [unowned self] in
            await fetchAndDecodeData(searchText)
            loadingState.value = .finished
            viewModelDidChange?(self)
        }
    }

    private func fetchAndDecodeData(_ searchText: String) async {
        await fetchSeriesData(searchText)
        await fetchAndAssignCountries()
    }

    private func fetchSeriesData(_ searchText: String) async {
        guard let seriesJSON = await networkService.fetchSeriesData(searchText),
              let series = decoder.decodeSeriesFromData(seriesJSON) else { return }
        seriesData = series.map { SeriesData(series: $0) }
    }

    private func fetchAndAssignCountries() async {
        guard let countriesData = await networkService.fetchCountryList(),
              let countries = decoder.decodeCountryList(countriesData) else { return }
        countryService.updateCountryList(with: countries)
        seriesData.forEach { $0.originCountry = countryService.getCountryNames(from: $0) }
    }
}

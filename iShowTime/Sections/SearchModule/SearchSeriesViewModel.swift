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

final class SearchSeriesViewModel: SectionViewModelProtocol,
                                   SectionViewModelRepresentableProtocol & SearchSeriesViewModelProtocol {
    private let networkManager: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()
    private let countryService = CountryService()
    private var currentTask: Task<Void, Error>?
    private var countries: [Country]?
    private var searchText: String?

    var seriesData: [SeriesData] = []
    private let router: RouterProtocol

    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)?
    var numberOfRows: Int { seriesData.count }
    var heightForRow: Int { 165 }
    var promptLabelText: String { setPromptLabelText() }
    var promptLabelIsHidden: Bool { !seriesData.isEmpty }

    required init(router: RouterProtocol) {
        self.router = router
    }


    var loadingState: Box<LoadingState> = Box(value: LoadingState.initial)

    func showDetails(at indexPath: IndexPath) {
        let selectedSeries = seriesData[indexPath.item]
        router.showDetailSeriesViewController(seriesData: selectedSeries)
    }

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

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel? {
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
        guard let seriesJSON = await networkManager.fetchSeriesData(searchText),
              let series = decoder.decodeSeriesFromData(seriesJSON) else { return }
        seriesData = series.map { SeriesData(series: $0) }
        guard let countriesData = await networkManager.fetchCountryList(),
              let countries = decoder.decodeCountryList(countriesData) else { return }
        countryService.updateCountryList(with: countries)
        seriesData.forEach { $0.originCountry = countryService.getCountryNames(from: $0) }
    }

    private func setPromptLabelText() -> String {
        switch loadingState.value {
        case .initial: return Constants.Labels.initialPrompt
        case .loading: return Constants.Labels.isLoadingPrompt
        case .finished: return Constants.Labels.finishedPrompt
        }
    }
}

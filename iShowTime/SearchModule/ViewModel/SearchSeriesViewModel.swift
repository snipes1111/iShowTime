//
//  SearchSeriesViewModel.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import Foundation

protocol SearchSeriesViewModelProtocol {
    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)? { get set }
    var promptLabelText: String { get }
    var promptLabelIsHidden: Bool { get }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    var loadingState: Box<NetworkService.LoadingState> { get }
    init(router: RouterProtocol)
    func fetchSeries(_ searchText: String?)
    func configureCell(_ searchCell: SearchSeriesCell, _ indexPath: IndexPath)
    func showDetails(at indexPath: IndexPath)
}

final class SearchSeriesViewModel: SearchSeriesViewModelProtocol {

    private var series: [Series] = []
    private let networkManager: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()
    private let countryService: CountryService = CountryService.shared

    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)?
    var promptLabelText: String {
        setPromptLabelText()
    }
    var promptLabelIsHidden: Bool = false
    var numberOfRows: Int { series.count }
    var heightForRow: Int { 165 }
    var loadingState: Box<NetworkService.LoadingState> = Box(value: NetworkService.LoadingState.initial)

    private var currentTask: Task<Void, Error>?
    private var countries: [Country]?
    private var router: RouterProtocol

    required init(router: RouterProtocol) {
        self.router = router
    }

    func fetchSeries(_ searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else { return }
        currentTask?.cancel()
        series.removeAll()
        loadingState.value = .loading
        promptLabelIsHidden = false
        let task = Task.delayed(byTimeInterval: 3) { [unowned self] in
            await fetchAndDecodeData(searchText)
            promptLabelIsHidden = !series.isEmpty
            viewModelDidChange?(self)
            loadingState.value = .finished
        }
        currentTask = task
    }

    func configureCell(_ searchCell: SearchSeriesCell, _ indexPath: IndexPath) {
        let seriesAtIndexPath = series[indexPath.item]
        let seriesViewModel = SearchSeriesCellViewModel(series: seriesAtIndexPath)
        searchCell.viewModel = seriesViewModel
    }

    func showDetails(at indexPath: IndexPath) {
        let series = series[indexPath.item]
        guard let id = series.id,
        let seriesName = series.name else { return }
        router.showDetailSeriesViewController(id, seriesName)
    }
}

extension SearchSeriesViewModel {

    private func fetchAndDecodeData(_ searchText: String) async {
        do {
            let seriesData = try await networkManager.fetchSeriesData(searchText)
            let countriesData = try await networkManager.fetchCountryList()
            guard let series = decoder.decodeSeriesFromData(seriesData) else { return }
            self.series = series
            guard let countries = decoder.decodeCountryList(countriesData) else { return }
            countryService.updateCountryList(with: countries)
        } catch NetworkService.NetworkErrors.invalidUrl {
            print("Invalid URL")
        } catch NetworkService.NetworkErrors.badResponse {
            print("Bad Response")
        } catch {
            print("Undefined error: \(error)")
        }
    }

    private func setPromptLabelText() -> String {
        switch loadingState.value {
        case .initial: return SearchModuleConstants.startSearchPromptText
        case .loading: return SearchModuleConstants.loadingSearchPromptText
        case .finished: return SearchModuleConstants.finishedSearchPromptText
        }
    }
}

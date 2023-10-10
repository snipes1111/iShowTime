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
    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)? { get set }
    var promptLabelText: String { get }
    var promptLabelIsHidden: Bool { get }
    var numberOfRows: Int { get }
    var loadingState: Box<LoadingState> { get }
    func fetchSeries(_ searchText: String?)
    func configureCell(_ searchCell: SearchSeriesCell, _ indexPath: IndexPath)
}

class SearchSeriesViewModel: SearchSeriesViewModelProtocol {

    private var series: [Series] = []
    let networkManager: NetworkServiceProtocol = NetworkService()
    let decoder: SeriesDecoderProtocol = SeriesDecoder()

    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)?
    var promptLabelText: String {
        setPromptLabelText()
    }
    var promptLabelIsHidden: Bool = false
    var numberOfRows: Int { series.count }
    var loadingState: Box<LoadingState> = Box(value: LoadingState.initial)

    private var currentTask: Task<Void, Error>?
    private var countries: [Country]?

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
        let countries = decodeCountries(seriesAtIndexPath)
        let seriesViewModel = SearchSeriesCellViewModel(series: seriesAtIndexPath, countries: countries)
        searchCell.viewModel = seriesViewModel
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
            self.countries = countries
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

    private func decodeCountries(_ series: Series) -> [Country] {
        var filteredCountries = [Country]()
        guard let encodedISO = series.originCountry,
        let countries = countries else { return filteredCountries }
        encodedISO.forEach { iso in
            if let country = countries.first(where: { $0.iso == iso }) {
                filteredCountries.append(country)
            }
        }
        return filteredCountries
    }
}

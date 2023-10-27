//
//  SearchSeriesViewModel.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import Foundation

protocol SearchSeriesViewModelProtocol {
    var promptLabelText: String { get }
    var promptLabelIsHidden: Bool { get }
    var loadingState: Box<NetworkService.LoadingState> { get }
}

final class SearchSeriesViewModel: SectionViewModel,
                                   SectionViewModelRepresentableProtocol & SearchSeriesViewModelProtocol {

    private let networkManager: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()
    private let countryService: CountryService = CountryService.shared
    private var currentTask: Task<Void, Error>?
    private var countries: [Country]?

    var promptLabelText: String {
        setPromptLabelText()
    }
    var promptLabelIsHidden: Bool = false
    var loadingState: Box<NetworkService.LoadingState> = Box(value: NetworkService.LoadingState.initial)

    func fetchSeries(_ searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else { return }
        currentTask?.cancel()
        series.removeAll()
        loadingState.value = .loading
        promptLabelIsHidden = false
        let task = Task.delayed(byTimeInterval: 2) { [unowned self] in
            await fetchAndDecodeData(searchText)
            promptLabelIsHidden = !series.isEmpty
            viewModelDidChange?(self)
            loadingState.value = .finished
        }
        currentTask = task
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel {
        let seriesAtIndexPath = series[indexPath.item]
        return SeriesCellViewModel(series: seriesAtIndexPath)
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
        case .initial: return SearchModuleConstants.welcomeText
        case .loading: return SearchModuleConstants.loading
        case .finished: return SearchModuleConstants.loadingFinished
        }
    }
}

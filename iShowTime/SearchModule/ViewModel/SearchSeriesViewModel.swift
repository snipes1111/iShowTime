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

    private func fetchAndDecodeData(_ searchText: String) async {
        do {
            let data = try await networkManager.fetchSeriesData(searchText)
            guard let series = decoder.decodeSeriesFromData(data) else { return }
            self.series = series
        } catch NetworkService.NetworkErrors.invalidUrl {
            print("Invalid URL")
        } catch NetworkService.NetworkErrors.badResponse {
            print("Bad Response")
        } catch {
            print("Undifined error: \(error)")
        }
    }

    private func setPromptLabelText() -> String {
        switch loadingState.value {
        case .initial: return SearchModuleConstants.startSearchPromptText
        case .loading: return SearchModuleConstants.loadingSearchPromptText
        case .finished: return SearchModuleConstants.finishedSearchPromptText
        }
    }

    func configureCell(_ searchCell: SearchSeriesCell, _ indexPath: IndexPath) {
        let seriesViewModel = SearchSeriesCellViewModel(series: series[indexPath.item])
        searchCell.viewModel = seriesViewModel
    }
}

//
//  SearchSeriesViewModel.swift
//  iShowTime
//
//  Created by user on 20/09/2023.
//

import Foundation

protocol SearchSeriesViewModelProtocol {
    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)? { get set }
    var isLoading: Box<Bool> { get }
    var promptLabelText: String { get }
    var promptLabelIsHidden: Bool { get }
    var numberOfRows: Int { get }
    func fetchSeries(_ searchText: String?)
    func configureCell(_ searchCell: SearchSeriesCell, _ indexPath: IndexPath)
}

class SearchSeriesViewModel: SearchSeriesViewModelProtocol {

    private var series: [Series] = []
    let networkManager: NetworkServiceProtocol = NetworkService()
    let decoder: SeriesDecoderProtocol = SeriesDecoder()

    var viewModelDidChange: ((SearchSeriesViewModelProtocol) -> Void)?
    var isLoading: Box<Bool> = Box(value: false)
    var promptLabelText: String {
        !isLoading.value ? SearchModuleConstants.startSearchPromptText : SearchModuleConstants.loadingSearchPromptText
    }
    var promptLabelIsHidden: Bool = false
    var numberOfRows: Int { series.count }

    private var currentTask: Task<Void, Error>?

    func fetchSeries(_ searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else { return }
        currentTask?.cancel()
        series.removeAll()
        promptLabelIsHidden = false
        isLoading.value = true
        let task = Task.delayed(byTimeInterval: 3) { [unowned self] in
            await self.fetchAndDecodeData(searchText)
            self.promptLabelIsHidden = true
            self.isLoading.value = false
            self.viewModelDidChange?(self)
        }
        currentTask = task
    }

    private func fetchAndDecodeData(_ searchText: String) async {
        do {
            let data = try await networkManager.fetchSeriesData(searchText)
            guard let series = decoder.decodeSeriesFromData(data) else { return }
            self.series = series
        } catch {
            print("Error: \(error)")
        }
    }

    func configureCell(_ searchCell: SearchSeriesCell, _ indexPath: IndexPath) {
        let seriesViewModel = SearchSeriesCellViewModel(series: series[indexPath.item])
        searchCell.viewModel = seriesViewModel
    }
}

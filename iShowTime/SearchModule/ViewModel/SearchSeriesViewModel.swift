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

    func fetchSeries(_ searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else { return }
        isLoading.value.toggle()
        Task {
            do {
                let data = try await networkManager.fetchSeriesData(searchText)
                guard let series = decoder.decodeSeriesFromData(data) else { return }
                self.series = series
                print("Success_________: \(series)")
                self.promptLabelIsHidden = true
                self.isLoading.value.toggle()
                self.viewModelDidChange?(self)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

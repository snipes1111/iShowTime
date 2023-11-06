//
//  SearchDetailViewModel.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import Foundation

final class SearchDetailViewModel: SeriesDetailViewModel, SeriesDetailRepresentableProtocol {

    private let networkService: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()
    private let errorHandler = ErrorHandler()
    private let dataStorage: DataStoreManagerProtocol = DataStoreManger.shared

    func fetchSeriesDetails() {
        if let seriesFromStorage = dataStorage.getSeries(with: seriesId) {
            seriesData = seriesFromStorage
            viewModelDidChange?(self)
        } else {
            Task { [unowned self] in
                await fetchAndDecodeData()
                viewModelDidChange?(self)
            }
        }
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let seriesData = seriesData else { return nil }
        return SeriesDescriptionCellViewModel(seriesData: seriesData)
    }

    private func fetchAndDecodeData() async {
        do {
            let seriesJSON = try await networkService.fetchSeriesDetails(seriesId)
            guard let series = decoder.decodeSeriesDetailsFromData(seriesJSON) else { return }
            seriesData = SeriesData(series: series)
        } catch {
            errorHandler.handle(error)
        }
    }
}

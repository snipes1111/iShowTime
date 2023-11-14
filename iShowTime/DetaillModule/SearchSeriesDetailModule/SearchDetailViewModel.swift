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
    private let dataStorage: DataStoreManagerProtocol = DataStoreManger()
    func fetchSeriesDetails() {
        guard let seriesId = seriesId else { return }
        if let seriesFromStorage = dataStorage.getSeries(with: seriesId) {
            seriesData = seriesFromStorage
            viewModelDidChange?(self)
        } else {
            fetchAndDecodeData()
        }
    }

    func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let seriesData = seriesData else { return nil }
        let viewModel = SeriesDescriptionCellViewModel(seriesData: seriesData)
        viewModel.countries = countries
        return viewModel
    }

    private func fetchAndDecodeData() {
        Task {
            guard let seriesId = seriesId,
                  let seriesJSON = await networkService.fetchSeriesDetails(seriesId),
                  let series = decoder.decodeSeriesDetailsFromData(seriesJSON) else { return }
            seriesData = SeriesData(series: series)
            viewModelDidChange?(self)
        }
    }
}

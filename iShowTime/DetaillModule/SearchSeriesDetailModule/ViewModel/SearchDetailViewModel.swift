//
//  SearchDetailViewModel.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import Foundation

final class SearchDetailViewModel: SeriesDetailViewModel {

    private let networkService: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()

    override func fetchSeriesDetails() {
        Task { [unowned self] in
            await fetchAndDecodeData()
            viewModelDidChange?(self)

        }
    }

    override func returnDetailCellViewModel() -> DetailCellViewModelProtocol? {
        guard let series = series else { return nil }
        return SearchDetailCellViewModel(series: series)
    }

    private func fetchAndDecodeData() async {
        do {
            let data = try await networkService.fetchSeriesDetails(seriesId)
            guard let series = decoder.decodeSeriesDetailsFromData(data) else { return }
            self.series = series
        } catch NetworkService.NetworkErrors.invalidUrl {
            print("Invalid URL")
        } catch NetworkService.NetworkErrors.badResponse {
            print("Bad Response")
        } catch {
            print("Undefined error: \(error)")
        }
    }
}

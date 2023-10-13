//
//  SearchDetailViewModel.swift
//  iShowTime
//
//  Created by user on 11/10/2023.
//

import UIKit

protocol SearchDetailViewModelProtocol {
    var viewModelDidChange: ((SearchDetailViewModelProtocol) -> Void)? { get set }
    var title: Box<String> { get }
    var backDropImageUrl: String? { get }
    var numberOfRows: Int { get }
    init(seriesId: Double)
    func fetchSeriesDetails()
    func configureCell(_ detailCell: SearchDetailSeriesCell)
}

final class SearchDetailViewModel: SearchDetailViewModelProtocol {

    private var seriesId: Double
    private var series: Series?
    private let networkService: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()

    var viewModelDidChange: ((SearchDetailViewModelProtocol) -> Void)?
    var title: Box<String> = Box(value: "")
    var nameTitle: String? {
        series?.name
    }
    var backDropImageUrl: String? { series?.backdropPath }
    var numberOfRows: Int { 1 }
    init(seriesId: Double) {
        self.seriesId = seriesId
    }

    func fetchSeriesDetails() {
        Task { [unowned self] in
            await fetchAndDecodeData()
            viewModelDidChange?(self)

        }
    }

    func configureCell(_ detailCell: SearchDetailSeriesCell) {
        guard let series = series else { return }
        let viewModel = SearchSeriesDetailCellViewModel(series: series)
        detailCell.viewModel = viewModel
    }

    private func fetchAndDecodeData() async {
        do {
            let data = try await networkService.fetchSeriesDetails(seriesId)
            guard let series = decoder.decodeSeriesDetailsFromData(data) else { return }
            self.series = series
            title.value = series.name ?? ""
        } catch NetworkService.NetworkErrors.invalidUrl {
            print("Invalid URL")
        } catch NetworkService.NetworkErrors.badResponse {
            print("Bad Response")
        } catch {
            print("Undefined error: \(error)")
        }
    }
}

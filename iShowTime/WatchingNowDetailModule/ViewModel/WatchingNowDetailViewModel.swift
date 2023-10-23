//
//  WatchingNowDetailViewModel.swift
//  iShowTime
//
//  Created by user on 19/10/2023.
//

import Foundation

import UIKit

protocol WatchingNowDetailViewModelProtocol {
    var viewModelDidChange: ((WatchingNowDetailViewModelProtocol) -> Void)? { get set }
    var title: Box<String> { get }
    var backDropImageUrl: String? { get }
    var numberOfRows: Int { get }
    init(seriesId: Double)
    func fetchSeriesDetails()
    func configureCell(_ detailCell: WatchingNowDetailViewCell)
}

final class WatchingNowDetailViewModel: WatchingNowDetailViewModelProtocol {

    private var seriesId: Double
    private var series: Series?
    private let networkService: NetworkServiceProtocol = NetworkService()
    private let decoder: SeriesDecoderProtocol = SeriesDecoder()

    var viewModelDidChange: ((WatchingNowDetailViewModelProtocol) -> Void)?
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

    func configureCell(_ detailCell: WatchingNowDetailViewCell) {
        guard let series = series else { return }
        let viewModel = WatchingNowDetailCellViewModel(series: series)
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

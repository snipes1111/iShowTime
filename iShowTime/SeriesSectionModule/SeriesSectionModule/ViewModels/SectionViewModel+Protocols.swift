//
//  SectionViewModel+Protocols.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 26/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

protocol SectionViewModelProtocol {
    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    var promptLabelIsHidden: Bool { get }
    init(router: RouterProtocol)
    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel?
}

protocol SectionViewModelRepresentableProtocol {
    var promptLabelText: String { get }
    func fetchSeries()
    func showDetails(at indexPath: IndexPath)
}

protocol EditableCellViewModelProtocol {
    func deleteRow(at indexPath: IndexPath)
}

class SectionViewModel: SectionViewModelProtocol {

    let router: RouterProtocol

    var seriesData: [SeriesData] = [] {
        didSet {
            if seriesData.isEmpty { viewModelDidChange?(self) }
        }
    }

    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)?
    var numberOfRows: Int { seriesData.count }
    var heightForRow: Int { 165 }
    var promptLabelIsHidden: Bool { !seriesData.isEmpty }
    
    required init(router: RouterProtocol) {
        self.router = router
    }

    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel? {
        SeriesCellViewModel(cellSeriesData: seriesData[indexPath.item])
    }
}

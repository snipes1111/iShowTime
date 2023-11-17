//
//  SectionViewModel.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import Foundation
import RealmSwift

protocol SectionViewModelProtocol {
    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    var promptLabelIsHidden: Bool { get }
    init(router: RouterProtocol)
}

protocol SectionViewModelRepresentableProtocol {
    var promptLabelText: String { get }
    func fetchSeries()
    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel?
    func showDetails(at indexPath: IndexPath)
}

class SectionViewModel: SectionViewModelProtocol {

    let router: RouterProtocol

    var seriesData: [SeriesData] = []
    
    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)?
    var numberOfRows: Int { seriesData.count }
    var heightForRow: Int { 165 }
    var promptLabelIsHidden: Bool { !seriesData.isEmpty }
    
    required init(router: RouterProtocol) {
        self.router = router
    }
}

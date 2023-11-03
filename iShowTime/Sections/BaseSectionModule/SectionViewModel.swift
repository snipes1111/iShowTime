//
//  SectionViewModel.swift
//  iShowTime
//
//  Created by user on 26/10/2023.
//

import Foundation
import RealmSwift

enum CellType {
    case search, watchingNow, favourite
}


protocol SectionViewModelProtocol {
    var viewModelDidChange: ((SectionViewModelProtocol) -> Void)? { get set }
    var numberOfRows: Int { get }
    var heightForRow: Int { get }
    var promptLabelText: String { get }
    var promptLabelIsHidden: Bool { get }
    init(router: RouterProtocol)
    func showDetails(at indexPath: IndexPath)
}

protocol SectionViewModelRepresentableProtocol {
    func fetchSeries()
    func returnCellViewModel(at indexPath: IndexPath) -> SeriesCellViewModel?
}


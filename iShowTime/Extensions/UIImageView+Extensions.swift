//
//  UIImageView+Extensions.swift
//  iShowTime
//
//  Created by user on 05/10/2023.
//

import UIKit

extension UIImageView {
    enum ImageFetchErrors: Error {
        case invalidUrl
        case noData
    }
    func getImage(with url: String) {
        let apiSetvice = APIService()
        guard let fullUrlPath = apiSetvice.buildImageUrl(url) else { return }
        Task {
            let (data, _) = try await URLSession.shared.data(from: fullUrlPath)
            guard let image = UIImage(data: data) else { throw ImageFetchErrors.noData }
            self.image = image
        }
    }
}

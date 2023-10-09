//
//  SeriesImageView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

class SeriesImageView: UIImageView {

    private let imageCacheManager = ImageCachingManager.shared

    init() {
        super.init(frame: .zero)
        image = UIImage(named: SearchModuleConstants.stubSeriesPoster)
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getImage(_ path: String) {
        Task {
            guard let data = await imageCacheManager.loadImage(with: path) else { return }
            image = UIImage(data: data)
        }
    }

}

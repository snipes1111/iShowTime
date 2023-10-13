//
//  SeriesImageView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class SeriesImageView: UIImageView {

    private let imageCacheManager = ImageCachingManager.shared

    init() {
        super.init(frame: .zero)
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getImage(_ path: String?) {
        image = UIImage(named: AssetsImages.noImage)
        guard let path = path else { return }
            Task {
                guard let data = await imageCacheManager.loadImage(with: path) else { return }
                image = UIImage(data: data)
            }
        }
}

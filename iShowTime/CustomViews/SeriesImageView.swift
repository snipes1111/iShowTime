//
//  SeriesImageView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

final class SeriesImageView: UIImageView {

    private let imageCacheManager = ImageCachingManager()

    init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getImage(_ path: String?, completion: ((Bool) -> Void)? = nil) {
        image = UIImage(resource: .no)
        guard let path = path else {
            completion?(false)
            return
        }
            Task {
                guard let data = await imageCacheManager.loadImage(with: path) else {
                    completion?(false)
                    return
                }
                image = UIImage(data: data)
                completion?(true)
            }
        }
}

//
//  ImageCachingManager.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 09/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

protocol ImageCachingManagerProtocol {
    func loadImage(with url: String) async -> Data?
}

final class ImageCachingManager: ImageCachingManagerProtocol {

    private let imageCache = NSCache<AnyObject, AnyObject>()
    private let apiService = APIService()
    private let networkService: NetworkServiceProtocol = NetworkService()

    func loadImage(with url: String) async -> Data? {
        guard let imagePath = apiService.buildImageUrl(url) else { return nil }
        if let cacheData = loadImageFromCache(imagePath) {
            return cacheData
        } else {
            let data = await downloadAndSaveImage(imagePath)
            return data
        }
    }

    private func loadImageFromCache(_ url: URL) -> Data? {
        let cachedKey = NSString(string: url.absoluteString)
        return imageCache.object(forKey: cachedKey) as? Data
    }

    private func downloadAndSaveImage(_ url: URL) async -> Data? {
        guard let data = await networkService.fetchImageData(with: url) else { return nil }
        let cachedKey = NSString(string: url.absoluteString)
        imageCache.setObject(data as NSData, forKey: cachedKey)
        return data
    }
}

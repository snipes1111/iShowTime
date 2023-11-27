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

protocol CachedImageProtocol {
    func loadImageFromCache(_ url: String) -> Data?
}

final class ImageCachingManager: ImageCachingManagerProtocol, CachedImageProtocol {

    static let shared = ImageCachingManager()

    private let imageCache = NSCache<AnyObject, AnyObject>()
    private let apiService = APIService()
    private let networkService: NetworkServiceProtocol = NetworkService()

    private init() {}

    func loadImage(with url: String) async -> Data? {
        if let cacheData = loadImageFromCache(url) {
            return cacheData
        } else {
            let data = await downloadAndSaveImage(url)
            return data
        }
    }

    func loadImageFromCache(_ url: String) -> Data? {
        let cachedKey = NSString(string: url)
        return imageCache.object(forKey: cachedKey) as? Data
    }

    private func downloadAndSaveImage(_ url: String) async -> Data? {
        guard let imagePath = apiService.buildImageUrl(url) else { return nil }
        guard let data = await networkService.fetchImageData(with: imagePath) else { return nil }
        let cachedKey = NSString(string: url)
        imageCache.setObject(data as NSData, forKey: cachedKey)
        return data
    }
}

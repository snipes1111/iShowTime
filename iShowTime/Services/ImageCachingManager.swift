//
//  ImageCachingManager.swift
//  iShowTime
//
//  Created by user on 09/10/2023.
//

import UIKit

protocol ImageCachingManagerProtocol {
    func loadImage(with url: String) async -> Data?
    func clearCache()
}

final class ImageCachingManager: ImageCachingManagerProtocol {

    private let imageCache = NSCache<AnyObject, AnyObject>()
    private let apiService = APIService()
    private let networkService: NetworkServiceProtocol = NetworkService()
    private let errorHandler = ErrorHandler()

    func loadImage(with url: String) async -> Data? {
        guard let imagePath = apiService.buildImageUrl(url) else { return nil }
        if let cacheData = loadImageFromCache(imagePath) {
            return cacheData
        } else {
            do {
                let data = try await downloadImage(imagePath)
                return data
            } catch {
                errorHandler.handle(error)
            }
        }
        return nil
    }

    func clearCache() {
        imageCache.removeAllObjects()
    }

    private func loadImageFromCache(_ url: URL) -> Data? {
        let cachedKey = NSString(string: url.absoluteString)
        let data = imageCache.object(forKey: cachedKey) as? Data
        return data
    }

    private func downloadImage(_ url: URL) async throws -> Data {
        let urlRequest = URLRequest(url: url)
        let data = try await networkService.fetchData(with: urlRequest)
        let cachedKey = NSString(string: url.absoluteString)
        imageCache.setObject(data as NSData, forKey: cachedKey)
        return data
    }
}

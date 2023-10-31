//
//  ErrorHandler.swift
//  iShowTime
//
//  Created by user on 30/10/2023.
//

import Foundation

class ErrorHandler {
    func handle(_ networkError: Error) {
        guard let error = (networkError as? NetworkService.NetworkErrors)
        else {
            print("Undefined error: \(networkError)")
            return
        }
        switch error {
        case .invalidUrl: print("Invalid URL")
        case .badResponse: print("Bad Response")
        }
    }
}

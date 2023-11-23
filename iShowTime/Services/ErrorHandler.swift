//
//  ErrorHandler.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 30/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
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

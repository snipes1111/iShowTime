//
//  Box.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 21/09/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> Void

    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(value: T) {
        self.value = value
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}

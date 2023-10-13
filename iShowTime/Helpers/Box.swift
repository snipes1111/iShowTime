//
//  Box.swift
//  iShowTime
//
//  Created by user on 21/09/2023.
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

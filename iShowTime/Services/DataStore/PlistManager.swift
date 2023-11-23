//
//  PlistManager.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 04/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import Foundation

final class PlistManager {
    static func getValue(from key: String) -> String? {
        guard let path = Bundle.main.path(forResource: "AccessInfo", ofType: "plist"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil }
        do {
            let dict = try PropertyListDecoder().decode([String: String].self, from: data)
            return dict[key]
        } catch {
            print("Failed to load data from plist")
            return nil
        }
    }
}

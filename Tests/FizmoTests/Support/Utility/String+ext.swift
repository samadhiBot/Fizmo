//
//  String+ext.swift
//  MiniFizmo
//
//  Created by Chris Sessions on 2/15/23.
//

import Foundation

extension String {
    public func decoded<T: Decodable>() throws -> T {
        guard let jsonData = data(using: .utf8) else {
            fatalError()
        }
        return try jsonData.decoded()
    }

    public func indent(_ tabs: Int = 1) -> String {
        guard !isEmpty else { return self }

        let spaces = String(repeating: " ", count: 2 * tabs)
        return replacingOccurrences(of: "\n", with: "\n\(spaces)")
    }
}

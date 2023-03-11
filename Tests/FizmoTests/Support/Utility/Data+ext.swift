//
//  Data+ext.swift
//  MiniFizmo
//
//  Created by Chris Sessions on 2/14/23.
//

import Foundation

extension Data {
    public func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }

    public var json: String {
        guard let json = String(data: self, encoding: .utf8) else {
            return "???"
        }
        return json
    }
}

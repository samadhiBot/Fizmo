//
//  Encodable+ext.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/14/23.
//

import Foundation

extension Encodable {
    public func encoded() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [
            .prettyPrinted,
            .sortedKeys,
        ]
        return try encoder.encode(self)
    }
}

//
//  Thing.swift
//  Fizmo
//
//  Created by Chris Sessions on 1/28/23.
//

import Foundation

/// <#Description#>
public struct Thing: Codable {
    /// <#Description#>
    public private(set) var action: Routine.ID?

    /// <#Description#>
    public private(set) var adjectives: [String]

    /// <#Description#>
    public private(set) var nouns: [String]

    public init(
        action: Routine.ID? = nil,
        adjectives: [String] = [],
        nouns: [String] = []
    ) {
        self.action = action
        self.adjectives = adjectives
        self.nouns = nouns
    }
}

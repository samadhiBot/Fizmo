//
//  Thing.swift
//  Fizmo
//
//  Created by Chris Sessions on 1/28/23.
//

import Foundation

/// <#Description#>
public struct Thing {
    /// <#Description#>
    public private(set) var action: Function?

    /// <#Description#>
    public private(set) var adjectives: [String]

    /// <#Description#>
    public private(set) var nouns: [String]

    public init(
        action: Function? = nil,
        adjectives: [String] = [],
        nouns: [String] = []
    ) {
        self.action = action
        self.adjectives = adjectives
        self.nouns = nouns
    }
}

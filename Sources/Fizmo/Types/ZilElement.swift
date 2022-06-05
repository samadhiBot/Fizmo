//
//  ZilElement.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import Foundation

/// The set of Zil elements that can be contained in a Zil ``Table``.
public enum ZilElement: Equatable {
    /// A boolean element.
    case bool(Bool)

    /// An integer element.
    case int(Int)

    /// An object element.
    case object(Object)

    /// A room element.
    case room(Room)

    /// A string element.
    case string(String)

    /// A table element.
    case table(Table)
}

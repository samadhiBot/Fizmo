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

    /// An 8-bit integer (`byte`) element.
    case int8(Int8)

    /// A 16-bit integer (`word`) element.
    case int16(Int16)

    /// A 32-bit integer (`lexv`) element.
    case int32(Int32)

    /// A `lexv` grouping consists of one 16-bit integer (`word`) element and two 8-bit integer
    /// (`byte`) elements.
    case lexv(Int16, Int8, Int8)

    /// An object element.
    case object(Object)

    /// A room element.
    case room(Room)

    /// A string element.
    case string(String)

    /// A table element.
    case table(Table)
}

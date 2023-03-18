//
//  ZilElement.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import Foundation
import Identity

/// The set of Zil elements that can be contained in a Zil ``Table``.
public enum ZilElement: Codable, Equatable {
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

    /// A `nil` value element.
    case none

    /// An object element.
    case object(Object.ID)

    /// A room element.
    case room(Room.ID)

    case routine(Routine.ID)

    /// A string element.
    case string(String)

    /// A table element.
    case table(Table)
}

extension ZilElement {
    public static func table(
        _ elements: ZilElement...,
        flags: Table.Flag...
    ) -> ZilElement {
        .table(.init(
            elements: elements,
            flags: flags
        ))
    }
}
//extension ZilElement {
//    /// Creates an object element representing a room.
//    public static func room(_ room: Room.ID) -> ZilElement {
//        .object(room)
//    }
//}

// MARK: - Conformances

extension ZilElement: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        self = .bool(value)
    }
}

extension ZilElement: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self = .int(value)
    }
}

extension ZilElement: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self = .string(value)
    }
}

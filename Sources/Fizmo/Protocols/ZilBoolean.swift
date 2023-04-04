//
//  ZilBoolean.swift
//  Fizmo
//
//  Created by Chris Sessions on 4/21/22.
//

import Foundation

/// A protocol that contains functions corresponding to Zil's boolean logic functions.
///
public protocol ZilBoolean {
    static func and(_ others: Self...) -> Self

    static func isNot(_ subject: Self?) -> Bool

    static func or(_ others: Self...) -> Self
}

// MARK: - Conformances

extension Bool: ZilBoolean {
    /// Returns `true` when `self` and *all* of the other values are `true`.
    ///
    /// The `and` logic is based on the ZIL
    /// [AND](https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.3utoxif)
    /// function.
    ///
    /// - Parameter others: One or more values to evaluate against `self`.
    ///
    /// - Returns: Whether `self` and all of the other values evaluate to `true`.
    public static func and(_ flags: Bool...) -> Bool {
        flags.reduce(true) { $0 && $1 }
    }

    /// Returns `true` when the subject is either false or nil.
    ///
    /// - Parameter subject: The subject under consideration.
    ///
    /// - Returns: Whether the subject is either false or nil.
    public static func isNot(_ subject: Bool?) -> Bool {
        guard let subject else { return false }
        return !subject
    }

    /// Returns `true` when `self` or *any* of the other values are `true`.
    ///
    /// - Parameter others: One or more values to evaluate against `self`.
    ///
    /// - Returns: Whether `self` or any of the other values evaluate to `true`.
    public static func or(_ flags: Bool...) -> Bool {
        flags.reduce(false) { $0 || $1 }
    }
}

extension ZilElement: ZilBoolean {
    public static func and(_ elements: ZilElement...) -> ZilElement {
        var lastElement: ZilElement = .bool(false)

        for element in elements {
            switch element {
            case .bool(let bool):
                if bool == false { return element }
            case .int(let int):
                if int == 0 { return element }
            case .int8(let int8):
                if int8 == 0 { return element }
            case .int16(let int16):
                if int16 == 0 { return element }
            case .int32(let int32):
                if int32 == 0 { return element }
            case .lexv, .object, .room, .routine, .string, .table:
                continue
            case .none:
                return element
            }
            lastElement = element
        }

        return lastElement
    }

    public static func isNot(_ subject: ZilElement?) -> Bool {
        subject == nil
    }

    public static func or(_ elements: ZilElement...) -> ZilElement {
        for element in elements {
            switch element {
            case .bool(let bool):
                if bool == true { return element }
            case .int(let int):
                if int != 0 { return element }
            case .int8(let int8):
                if int8 != 0 { return element }
            case .int16(let int16):
                if int16 != 0 { return element }
            case .int32(let int32):
                if int32 != 0 { return element }
            case .lexv, .object, .room, .routine, .string, .table:
                return element
            case .none:
                continue
            }
        }

        return .bool(false)
    }
}

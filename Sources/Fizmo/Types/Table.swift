//
//  Table.swift
//  Fizmo
//
//  Created by Chris Sessions on 6/1/22.
//

import Foundation

/// A type that represents the Zil
/// [Table](https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.2kz067v)
/// structure.
///
/// The current implementation of `Table` does not do anything with the `WORD`, `BYTE`,`LEXV` and
/// `STRING` flags. These will be handled in the future as needed.
public struct Table: Equatable {
    /// The elements contained in the table.
    var elements: [ZilElement]

    /// Whether the table is mutable.
    let isMutable: Bool

    /// Whether the table has a _length_ flag at index 0, whose value is the number of `elements`.
    let hasLengthFlag: Bool

    /// Creates a new `Table`.
    ///
    /// - Parameters:
    ///   - elements: The elements contained in the table.
    ///   - isMutable: Whether the table is mutable.
    ///   - hasLengthFlag: Whether the table has a _length_ flag at index 0, whose value is the
    ///                    number of `elements`.
    public init(
        _ elements: ZilElement...,
        isMutable: Bool = true,
        hasLengthFlag: Bool = false
    ) {
        self.elements = elements
        self.isMutable = isMutable
        self.hasLengthFlag = hasLengthFlag
    }

    /// Returns the `ZilElement` at the specified `index`.
    ///
    /// When `hasLengthFlag` is set on a table, `index: 0` becomes reserved and returns the number
    /// of `elements`. `index: 1` returns the first element, `index: 2` returns the second element,
    /// and so on.
    ///
    /// - Parameter index: The index whose corresponding value is to be returned.
    ///
    /// - Returns: The `ZilElement` at the specified `index`.
    ///
    /// - Throws: When the `index` is out of range.
    public func get(at index: Int) throws -> ZilElement {
        var index = index
        if hasLengthFlag {
            if index == 0 {
                return .int(elements.count)
            }
            index -= 1
        }

        guard elements.count > index else {
            throw Error.indexOutOfRange
        }

        return elements[index]
    }

    /// Writes the `ZilElement` at the specified `index`, and returns the `ZilElement`.
    ///
    /// - Parameters:
    ///   - element: The `ZilElement` at the specified `index`.
    ///   - index: The index where the `ZilElement` is to be written.
    ///
    /// - Returns: The `ZilElement` that has been written to the table.
    ///
    /// - Throws: When attempting to write to an immutable table, when attempting to write to an
    ///          `index` that is out of range, or when attempting to write to the reserved
    ///          `index: 0` when `hasLengthFlag` is set on the table.
    public mutating func put(
        element: ZilElement,
        at index: Int
    ) throws -> ZilElement {
        guard isMutable else {
            throw Error.tableIsNotMutable
        }

        var index = index
        if hasLengthFlag {
            if index == 0 {
                throw Error.cannotWriteToLengthFlag
            }
            index -= 1
        }

        if index < elements.count {
            elements[index] = element
        } else if index == elements.count {
            elements.append(element)
        } else {
            throw Error.indexOutOfRange
        }

        return element
    }
}

extension Table {
    enum Error: Swift.Error {
        case cannotWriteToLengthFlag
        case indexOutOfRange
        case tableIsNotMutable
    }
}

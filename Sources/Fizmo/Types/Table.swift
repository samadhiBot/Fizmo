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
public struct Table: Equatable {
    /// The elements contained in the table.
    var elements: [ZilElement]

    /// Any modifiers to specify the table's composition and behavior.
    let flags: [Flag]

    /// Creates a new `Table` with the specified elements.
    ///
    /// - Parameters:
    ///   - elements: The elements contained in the table.
    ///   - flags: Any modifiers to specify the table's composition and behavior.
    public init(
        _ elements: ZilElement...,
        flags: [Flag] = []
    ) {
        self.elements = elements
        self.flags = flags
    }

    /// Creates a new `Table` per the specified parameters.
    ///
    /// - Parameters:
    ///   - count: The number of elements in the table.
    ///   - flags: Any modifiers to specify the table's composition and behavior.
    ///   - defaults: Zero or more elements to repeat until the table contains `count` elements. If
    ///               no defaults are specified, the table is filled with zeros.
    public init(
        count: Int,
        defaults: [ZilElement] = [],
        flags: [Flag] = []
    ) {
        self.elements = []
        self.flags = flags
        (0..<count).forEach { index in
            let el = defaults.isEmpty ? .int(0) : defaults[index % defaults.count]
            elements.append(el)
        }
    }
}

extension Table {
    /// The number of elements in the table.
    public var count: Int {
        elements.count
    }

    /// Returns the `ZilElement` at the specified `index`.
    ///
    /// When has the table has a `.length` flag set, index `0` is reserved and returns the number
    /// of `elements` in the table. When this is the case, elements are accessed from index `1`
    /// onward.
    ///
    /// - Parameter index: The index whose corresponding value is to be returned.
    ///
    /// - Returns: The `ZilElement` at the specified `index`.
    ///
    /// - Throws: When the `index` is out of range.
    public func get(at index: Int) throws -> ZilElement {
        var index = index
        if isOneIndexed {
            guard index > 0 else {
                return .int(elements.count)
            }
            index -= 1
        }

        guard elements.count > index else {
            throw Error.indexOutOfRange
        }

        return elements[index]
    }

    /// Whether the table is read-only, i.e. it cannot be changed after its creation.
    ///
    /// This is `true` for tables with a `.pure` flag set. When this is the case, an attempt to
    /// ``put(element:at:)`` will throw an error.
    public var isImmutable: Bool {
        flags.contains(.pure)
    }

    /// Whether the table is one-indexed, i.e. the first element is accessed at index `1` instead of
    /// index `0`.
    ///
    /// This is `true` for tables with a `.length` flag set. When this is the case, index `0`
    /// returns the number of elements in the table, and the first element is accessed at index `1`.
    public var isOneIndexed: Bool {
        flags.contains(.length)
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
    ///          `index: 0` when the table has a `.length` flag set.
    public mutating func put(
        element: ZilElement,
        at index: Int
    ) throws -> ZilElement {
        guard !isImmutable else {
            throw Error.tableIsNotMutable
        }

        var index = index
        if flags.contains(.length) {
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

// MARK: - Table.Error

extension Table {
    enum Error: Swift.Error {
        case cannotWriteToLengthFlag
        case indexOutOfRange
        case tableIsNotMutable
    }
}

// MARK: - Table.Flags

extension Table {
    /// The set of modifiers that specify the table's composition and behavior.
    public enum Flag: String {
        /// Specifies that the table elements are 1 byte in size.
        case byte

        /// Specifies that the table's first element (at index `0`) is occupied by a counter whose
        /// value is the number of `elements` in the table. In this case, access to the table's
        /// elements begins at index `1`.
        case length

        /// Specifies that the table elements are 4 bytes in size.
        ///
        /// See ``ZilElement/lexv(_:_:_:)`` for details on `lexv` elements created from default
        /// values.
        case lexv

        /// Leaves the table elements' size unspecified.
        case none

        /// Specifies that the table is immutable.
        case pure

        /// Specifies string
        case string

        /// Specifies that the table elements are 2 bytes in size.
        case word
    }
}

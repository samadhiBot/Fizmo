//
//  Direction.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/22/22.
//

import Foundation

/// A type of ``Object`` that represents a movement direction.
public class Direction: Object {
    /// Represents an exit to the north.
    static let north = Direction(id: "NORTH")

    /// Represents an exit to the east.
    static let east = Direction(id: "EAST")

    /// Represents an exit to the west.
    static let west = Direction(id: "WEST")

    /// Represents an exit to the south.
    static let south = Direction(id: "SOUTH")

    /// Represents an exit to the northeast.
    static let northEast = Direction(id: "NE")

    /// Represents an exit to the northwest.
    static let northWest = Direction(id: "NW")

    /// Represents an exit to the southeast.
    static let southEast = Direction(id: "SE")

    /// Represents an exit to the southwest.
    static let southWest = Direction(id: "SW")

    /// Represents an exit up.
    static let up = Direction(id: "UP")

    /// Represents an exit down.
    static let down = Direction(id: "DOWN")

    /// Represents an exit into another location.
    static let `in` = Direction(id: "IN")

    /// Represents an exit out of the current location.
    static let out = Direction(id: "OUT")
}

extension Direction: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

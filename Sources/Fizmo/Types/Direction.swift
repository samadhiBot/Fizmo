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
    public static let north = Direction(
        id: "north",
        synonyms: ["n"]
    )

    /// Represents an exit to the east.
    public static let east = Direction(
        id: "east",
        synonyms: ["e"]
    )

    /// Represents an exit to the west.
    public static let west = Direction(
        id: "west",
        synonyms: ["w"]
    )

    /// Represents an exit to the south.
    public static let south = Direction(
        id: "south",
        synonyms: ["s"]
    )

    /// Represents an exit to the northeast.
    public static let northEast = Direction(
        id: "northEast",
        synonyms: ["ne"]
    )

    /// Represents an exit to the northwest.
    public static let northWest = Direction(
        id: "northWest",
        synonyms: ["nw"]
    )

    /// Represents an exit to the southeast.
    public static let southEast = Direction(
        id: "southEast",
        synonyms: ["se"]
    )

    /// Represents an exit to the southwest.
    public static let southWest = Direction(
        id: "southWest",
        synonyms: ["sw"]
    )

    /// Represents an exit up.
    public static let up = Direction(
        id: "up",
        synonyms: ["u"]
    )

    /// Represents an exit down.
    public static let down = Direction(
        id: "down",
        synonyms: ["d"]
    )

    /// Represents an exit into another location.
    public static let `in` = Direction(id: "in")

    /// Represents an exit out of the current location.
    public static let out = Direction(id: "out")
}

extension Direction {
    /// Find a predefined `Direction` that matches the specified Zil atom.
    ///
    /// - Parameter zil: A Zil atom indicating a direction of movement.
    ///
    /// - Returns: A Fizmo `Direction` that matches the specified Zil atom, if one exists.
    public static func find(_ zil: String) -> Direction? {
        let id = zil.lowercased()
        return predefinedDirections.first {
            $0.id.rawValue.lowercased() == id || $0.synonyms.contains(id)
        }
    }

    /// All directions that are predefined in Fizmo.
    private static var predefinedDirections: [Direction] = [
        north,
        east,
        west,
        south,
        northEast,
        northWest,
        southEast,
        southWest,
        up,
        down,
        `in`,
        out,
    ]
}

// MARK: - Conformances

extension Direction: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

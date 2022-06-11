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
        synonyms: ["NORTH", "N"]
    )

    /// Represents an exit to the east.
    public static let east = Direction(
        id: "east",
        synonyms: ["EAST", "E"]
    )

    /// Represents an exit to the west.
    public static let west = Direction(
        id: "west",
        synonyms: ["WEST", "W"]
    )

    /// Represents an exit to the south.
    public static let south = Direction(
        id: "south",
        synonyms: ["SOUTH", "S"]
    )

    /// Represents an exit to the northeast.
    public static let northEast = Direction(
        id: "northEast",
        synonyms: ["NORTHEAST", "NE"]
    )

    /// Represents an exit to the northwest.
    public static let northWest = Direction(
        id: "northWest",
        synonyms: ["NORTHWEST", "NW"]
    )

    /// Represents an exit to the southeast.
    public static let southEast = Direction(
        id: "southEast",
        synonyms: ["SOUTHEAST", "SE"]
    )

    /// Represents an exit to the southwest.
    public static let southWest = Direction(
        id: "southWest",
        synonyms: ["SOUTHWEST", "SW"]
    )

    /// Represents an exit up.
    public static let up = Direction(
        id: "up",
        synonyms: ["UP", "U"]
    )

    /// Represents an exit down.
    public static let down = Direction(
        id: "down",
        synonyms: ["DOWN", "D"]
    )

    /// Represents an exit into another location.
    public static let `in` = Direction(
        id: "in",
        synonyms: ["IN"]
    )

    /// Represents an exit out of the current location.
    public static let out = Direction(
        id: "out",
        synonyms: ["OUT"]
    )
}

extension Direction {
    /// Find a predefined `Direction` that matches the specified Zil atom.
    ///
    /// - Parameter zil: A Zil atom indicating a direction of movement.
    ///
    /// - Returns: A Fizmo `Direction` that matches the specified Zil atom, if one exists.
    public static func find(_ zil: String) -> Direction? {
        predefined.first {
            $0.synonyms.contains(zil)
        }
    }

    /// An array of all directions that are predefined in Fizmo.
    public static var predefined: [Direction] {
        [
            .north,
            .east,
            .west,
            .south,
            .northEast,
            .northWest,
            .southEast,
            .southWest,
            .up,
            .down,
            .in,
            .out,
        ]
    }
}

// MARK: - Conformances

extension Direction: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//
//  Object.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import Foundation

public typealias Function = () -> Bool

public class Room: Object {}

/// Objects are things in the world with which the player can interact.
public class Object {
    /// The object's unique identifier.
    public let id: Object.Identifier

    /// <#Description#>
    public private(set) var action: Function?

    /// <#Description#>
    public private(set) var adjectives: [String]

    /// <#Description#>
    public private(set) var adventurerFunction: Function?

    /// <#Description#>
    public private(set) var capacity: Int?

    /// <#Description#>
    public private(set) var containerFunction: Function?

    /// <#Description#>
    public private(set) var descriptionFunction: Function?

    /// A dictionary containing each ``Direction`` and corresponding ``Movement`` that is possible
    /// in the room.
    public private(set) var directions: [Direction: Movement]

    /// <#Description#>
    public private(set) var firstDescription: String?

    /// <#Description#>
    public private(set) var flags: [Flag]

    /// <#Description#>
    public private(set) var globals: [Object]

    /// <#Description#>
    public private(set) var longDescription: String?

    /// <#Description#>
    public private(set) var parent: Object?

    /// <#Description#>
    public private(set) var pseudos: [String: Function]

    /// <#Description#>
    public private(set) var shortDescription: String?

    /// <#Description#>
    public private(set) var size: Int?

    /// <#Description#>
    public private(set) var strength: Int?

    /// <#Description#>
    public private(set) var synonyms: [String]

    /// <#Description#>
    public private(set) var takeValue: Int?

    /// <#Description#>
    public private(set) var text: String?

    /// <#Description#>
    public private(set) var things: [Thing]

    /// <#Description#>
    public private(set) var vType: Flag?

    /// <#Description#>
    public private(set) var value: Int?

    /// <#Description#>
    public private(set) var vehicleType: Bool

    public init(
        id: Object.Identifier,
        action: Function? = nil,
        adjectives: [String] = [],
        adventurerFunction: Function? = nil,
        capacity: Int? = nil,
        containerFunction: Function? = nil,
        description: String? = nil,
        descriptionFunction: Function? = nil,
        directions: [Direction: Movement] = [:],
        firstDescription: String? = nil,
        flags: [Flag] = [],
        globals: [Object] = [],
        location: Object? = nil,
        longDescription: String? = nil,
        pseudos: [String: Function] = [:],
        size: Int? = nil,
        strength: Int? = nil,
        synonyms: [String] = [],
        takeValue: Int? = nil,
        text: String? = nil,
        things: [Thing] = [],
        vType: Flag? = nil,
        value: Int? = nil,
        vehicleType: Bool = false
    ) {
        self.action = action
        self.adjectives = adjectives
        self.adventurerFunction = adventurerFunction
        self.capacity = capacity
        self.descriptionFunction = descriptionFunction
        self.directions = directions
        self.firstDescription = firstDescription
        self.flags = flags
        self.globals = globals
        self.id = id
        self.longDescription = longDescription
        self.parent = location
        self.pseudos = pseudos
        self.shortDescription = description
        self.size = size
        self.strength = strength
        self.synonyms = synonyms
        self.takeValue = takeValue
        self.text = text
        self.things = things
        self.vType = vType
        self.value = value
        self.vehicleType = vehicleType
    }

    /// Evaluates whether the object is located directly within the specified ``Room`` or
    /// ``Object``.
    ///
    /// - Parameter other: The room or object in which to look for `self`.
    ///
    /// - Returns: Whether `self` is in the specified object.
    func isIn(_ other: Object) -> Bool {
        parent == other
    }

    /// Change the location of `self` to the specified ``Room`` or ``Object``.
    ///
    /// - Parameter to: The object to which `self` is moved.
    func move(to other: Object) {
        parent = other
    }
}

// MARK: - Conformances

extension Object: CustomStringConvertible {
    public var description: String {
        id.rawValue
    }
}

extension Object: Equatable {
    public static func == (lhs: Object, rhs: Object) -> Bool {
        lhs.id.rawValue == rhs.id.rawValue
    }
}

extension Object: Identifiable {
}

// MARK: - Object.Identifier

extension Object {
    /// A unique object identifier.
    public struct Identifier: Hashable {
        let rawValue: String
    }
}

extension Object.Identifier: Comparable {
    public static func < (lhs: Object.Identifier, rhs: Object.Identifier) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Object.Identifier: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}

extension Object.Identifier: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    public init(stringLiteral value: String) {
        rawValue = value
    }
}

// MARK: - Object.Identifier

extension Object {
    /// <#Description#>
    public enum Property: Equatable {
        case action
        case adjectives
        case capacity
        case descriptionFunction
        case firstDescription
        case flags
        case globals
        case longDescription
        case parent
        case pseudos
        case shortDescription
        case size
        case strength
        case synonyms
        case takeValue
        case text
        case vType
        case value
    }
}


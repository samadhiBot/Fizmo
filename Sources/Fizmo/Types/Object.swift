//
//  Object.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import Foundation

public typealias Function = () -> Bool

/// Objects are things in the world with which the player can interact.
public class Object {
    /// The object's unique identifier.
    public let id: Object.Identifier

    /// <#Description#>
    public private(set) var action: Function?

    /// <#Description#>
    public private(set) var adjectives: [String]

    /// <#Description#>
    public private(set) var capacity: Int?

    /// <#Description#>
    public private(set) var descriptionFunction: String?

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
    public private(set) var vType: Flag?

    /// <#Description#>
    public private(set) var value: Int?


    public init(
        id: Object.Identifier,
        action: Function? = nil,
        adjectives: [String] = [],
        flags: [Flag] = [],
        capacity: Int? = nil,
        description: String? = nil,
        descriptionFunction: String? = nil,
        firstDescription: String? = nil,
        globals: [Object] = [],
        longDescription: String? = nil,
        parent: Object? = nil,
        pseudos: [String: Function] = [:],
        size: Int? = nil,
        strength: Int? = nil,
        synonyms: [String] = [],
        takeValue: Int? = nil,
        text: String? = nil,
        vType: Flag? = nil,
        value: Int? = nil
    ) {
        self.id = id
        self.action = action
        self.adjectives = adjectives
        self.flags = flags
        self.capacity = capacity
        self.shortDescription = description
        self.descriptionFunction = descriptionFunction
        self.firstDescription = firstDescription
        self.globals = globals
        self.longDescription = longDescription
        self.parent = parent
        self.pseudos = pseudos
        self.size = size
        self.strength = strength
        self.synonyms = synonyms
        self.takeValue = takeValue
        self.text = text
        self.vType = vType
        self.value = value
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
        lhs.id == rhs.id
    }
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

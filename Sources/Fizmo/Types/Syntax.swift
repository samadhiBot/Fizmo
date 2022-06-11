//
//  Syntax.swift
//  Fizmo
//
//  Created by Chris Sessions on 5/5/22.
//

import Foundation

/// Represents a Zil
/// [SYNTAX](https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#)
/// definition, which specifies which action and pre-action routines should be called for a given
/// verb phrase.
public struct Syntax: Equatable {
    public let verb: String
    public let directObject: Object?
    public let indirectObject: Object?
    public let actionRoutineName: String
    public let preActionRoutineName: String?

    public init(
        verb: String,
        directObject: Object? = nil,
        indirectObject: Object? = nil,
        actionRoutineName: String,
        preActionRoutineName: String? = nil
    ) {
        self.verb = verb
        self.directObject = directObject
        self.indirectObject = indirectObject
        self.actionRoutineName = actionRoutineName
        self.preActionRoutineName = preActionRoutineName
    }
}

extension Syntax {
    public struct Object: Equatable {
        public let preposition: String?
        public let findFlag: Flag?
        public let searchFlags: [SearchFlag]

        public init(
            preposition: String? = nil,
            where findFlag: Flag? = nil,
            search searchFlags: [SearchFlag] = []
        ) {
            self.preposition = preposition
            self.findFlag = findFlag
            self.searchFlags = searchFlags
        }
    }

    public enum SearchFlag: String {
        case carried  = "CARRIED"
        case have     = "HAVE"
        case held     = "HELD"
        case inRoom   = "IN-ROOM"
        case many     = "MANY"
        case onGround = "ON-GROUND"
        case take     = "TAKE"

        public var `case`: String {
            switch self {
            case .carried:  return ".carried"
            case .have:     return ".have"
            case .held:     return ".held"
            case .inRoom:   return ".inRoom"
            case .many:     return ".many"
            case .onGround: return ".onGround"
            case .take:     return ".take"
            }
        }
    }
}

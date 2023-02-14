//
//  Movement.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/22/22.
//

import Foundation

/// The set of ways to define movement in some direction.
public enum Movement {
    case to(Room.Identifier)
    case blocked(String)
    case conditional(Room.Identifier, `if`: Bool )
    case conditionalElse(Room.Identifier, `if`: Bool, `else`: String)
    case per(() -> Object?)
}

// MARK: - Conformances

extension Movement: Equatable {
    public static func == (lhs: Movement, rhs: Movement) -> Bool {
        switch (lhs, rhs) {
        case (.to, .to),
             (.blocked, .blocked),
             (.conditional, .conditional),
             (.conditionalElse, .conditionalElse):
            return lhs == rhs
        case (.per(let lFunc), .per(let rFunc)):
            return  lFunc() == rFunc()
        default:
            return false
        }
    }
}

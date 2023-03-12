//
//  Movement.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/22/22.
//

import Foundation

/// The set of ways to define movement in some direction.
public enum Movement: Codable, Equatable {
    case blocked(String)
    case conditional(Room.ID, `if`: Routine.ID)
    case conditionalElse(Room.ID, `if`: Routine.ID, `else`: String)
    case per(Routine.ID)
    case to(Room.ID)
}

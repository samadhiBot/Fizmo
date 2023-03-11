//
//  Routine.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/20/23.
//

import Foundation
import Identity

public struct Routine: Equatable, Identifiable {
    public let id: Routine.ID
}

public extension Routine {
    enum Function {
        case intBool((Int) -> Bool)
        case intVoid((Int) -> Void)
        case voidBool(() -> Bool)
        case voidVoid(() -> Void)
    }
}

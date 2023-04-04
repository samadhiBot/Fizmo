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
        case boolToOptionalRoutine((Bool) -> Routine?)
        case intToBool((Int) -> Bool)
        case intToVoid((Int) -> Void)
        case optionalIntToBool((Int?) -> Bool)
        case optionalIntToVoid((Int?) -> Void)
        case throwingIntToVoid((Int) throws -> Void)
        case throwingOptionalIntToBool((Int?) throws -> Bool)
        case throwingOptionalIntToVoid((Int?) throws -> Void)
        case throwingVoidToBool(() throws -> Bool)
        case throwingVoidToVoid(() throws -> Void)
        case voidToBool(() -> Bool)
        case voidToRoutine(() -> Routine)
        case voidToVoid(() -> Void)
    }
}

//
//  MicroCosm.swift
//  MicroCosm
//
//  Created by Chris Sessions on 2/19/23.
//

import Fizmo

/// Represents the MicroCosm game.
final class MicroCosm {
    let constants: Constants
    let directions: [Direction]
    let globals: Globals
    let objects: Objects
    let rooms: Rooms

    private init() {
        constants = Constants()
        directions = Directions.combined
        globals = Globals()
        objects = Objects()
        rooms = Rooms()
    }

    private(set) static var shared = MicroCosm()
}

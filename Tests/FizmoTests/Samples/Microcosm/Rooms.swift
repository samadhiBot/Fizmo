//
//  Rooms.swift
//  MicroCosm
//
//  Created by Chris Sessions on 2/21/23.
//

import Fizmo

class Rooms: Codable {
    /// The `westOfHouse` (WEST-OF-HOUSE) room.
    var westOfHouse = Room(
        id: "westOfHouse",
        action: "westHouse",
//            description: "West of House",
        directions: [
            .north: .to("northOfHouse"),
            .south: .to("southOfHouse"),
            .northEast: .to("northOfHouse"),
            .southEast: .to("southOfHouse"),
            .west: .to("forest1"),
            .east: .blocked("The door is boarded and you can't remove the boards."),
            .southWest: .conditional("stoneBarrow", if: "wonFlag"),
            .in: .conditional("stoneBarrow", if: "wonFlag"),
        ]
//            flags: [
//                .isDryLand,
//                .isOn,
//                .isSacred,
//            ],
//            globals: [
////                whiteHouse,
////                board,
////                forest,
//            ],
//            location: rooms
    )
}

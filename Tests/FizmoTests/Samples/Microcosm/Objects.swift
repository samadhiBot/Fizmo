//
//  Objects.swift
//  MicroCosm
//
//  Created by Chris Sessions on 2/21/23.
//

import Fizmo

class Objects: Codable {
    static var Global: Globals { MicroCosm.shared.globals }
    static var Room: Rooms { MicroCosm.shared.rooms }

    var jackpot = Object(
        id: "jackpot",
        action: "incrementScore"
    )

    /// The `mailbox` (MAILBOX) object.
    var mailbox = Object(
        id: "mailbox",
        action: "mailboxFunc",
        adjectives: ["small"],
        capacity: 10
//            description: "small mailbox",
//            flags: [
//                .isContainer,
//                .noImplicitTake,
//            ],
//            location: MicroCosm.shared.world.rooms.westOfHouse,
//            synonyms: ["mailbox", "box"]
    )

    /// The `rooms` (ROOMS) object.
    var rooms = Object(
        id: "rooms",
        directions: [.in: .to("rooms")]
    )
}

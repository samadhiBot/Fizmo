//
//  RoomTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import CustomDump
import XCTest
import Fizmo

final class RoomTests: XCTestCase {
    func testCircularReferences() {
        /// The `rooms` (ROOMS) object.
        let rooms = Object(
            id: "rooms",
            directions: [.in: .to("rooms")]
        )

        /// The `westOfHouse` (WEST-OF-HOUSE) room.
        let westOfHouse = Room(
            id: "westOfHouse",
            directions: [.north: .to("northOfHouse")],
            location: rooms
        )

        /// The `northOfHouse` (NORTH-OF-HOUSE) room.
        let northOfHouse = Room(
            id: "northOfHouse",
            directions: [.southWest: .to("westOfHouse")],
            location: rooms
        )

        XCTAssertNotNil(rooms)
        XCTAssertNotNil(westOfHouse)
        XCTAssertNotNil(northOfHouse)
    }
}


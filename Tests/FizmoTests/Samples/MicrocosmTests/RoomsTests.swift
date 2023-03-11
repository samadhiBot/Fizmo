//
//  RoomsTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/11/23.
//

import CustomDump
import Fizmo
import Identity
import XCTest

final class RoomsTests: FizmoTests {
    func testRoomEncoding() throws {
        XCTAssertNoDifference(
            try westOfHouse.encoded().json,
            westOfHouseJSON
        )
    }

    func testRoomDecoding() throws {
        XCTAssertNoDifference(
            try westOfHouseJSON.decoded(),
            westOfHouse
        )
    }
}

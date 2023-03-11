//
//  ZilElementTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import CustomDump
import XCTest
import Fizmo

final class ZilElementTests: FizmoTests {
    func testRoomObjectEquatable() {
        XCTAssertNoDifference(
            ZilElement.object(Object(id: "tree")),
            ZilElement.room(Object(id: "tree"))
        )
    }
}

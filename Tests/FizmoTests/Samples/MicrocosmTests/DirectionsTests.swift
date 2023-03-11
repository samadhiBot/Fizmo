//
//  DirectionsTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/11/23.
//

import CustomDump
import Fizmo
import Identity
import XCTest

final class DirectionsTests: FizmoTests {
    func testDirections() {
        XCTAssertNoDifference(MicroCosm.shared.directions, [
            .north,
            .east,
            .west,
            .south,
            .northEast,
            .northWest,
            .southEast,
            .southWest,
            .up,
            .down,
            .in,
            .out,
            Direction(id: "land", synonyms: "LAND"),
        ])
    }
}

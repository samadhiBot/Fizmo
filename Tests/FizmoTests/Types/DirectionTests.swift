//
//  DirectionTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/14/23.
//

import XCTest
import Fizmo

extension Direction {
    /// Represents an exit toward land.
    public static let land = Direction(
        id: "land",
        synonyms: ["LAND"]
    )
}

final class DirectionTests: XCTestCase {
    func testPredefinedDirections() throws {
        XCTAssertEqual(Direction.find("NORTH"), .north)
        XCTAssertEqual(Direction.find("N"), .north)
        XCTAssertEqual(Direction.find("EAST"), .east)
        XCTAssertEqual(Direction.find("E"), .east)
        XCTAssertEqual(Direction.find("WEST"), .west)
        XCTAssertEqual(Direction.find("W"), .west)
        XCTAssertEqual(Direction.find("SOUTH"), .south)
        XCTAssertEqual(Direction.find("S"), .south)
        XCTAssertEqual(Direction.find("NORTHEAST"), .northEast)
        XCTAssertEqual(Direction.find("NE"), .northEast)
        XCTAssertEqual(Direction.find("NORTHWEST"), .northWest)
        XCTAssertEqual(Direction.find("NW"), .northWest)
        XCTAssertEqual(Direction.find("SOUTHEAST"), .southEast)
        XCTAssertEqual(Direction.find("SE"), .southEast)
        XCTAssertEqual(Direction.find("SOUTHWEST"), .southWest)
        XCTAssertEqual(Direction.find("SW"), .southWest)
        XCTAssertEqual(Direction.find("UP"), .up)
        XCTAssertEqual(Direction.find("U"), .up)
        XCTAssertEqual(Direction.find("DOWN"), .down)
        XCTAssertEqual(Direction.find("D"), .down)
        XCTAssertEqual(Direction.find("IN"), .in)
        XCTAssertEqual(Direction.find("OUT"), .out)
    }

    func testCustomDirection() throws {
        XCTAssertEqual(Direction.find("LAND"), .land)
    }
}

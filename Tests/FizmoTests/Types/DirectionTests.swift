//
//  DirectionTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/14/23.
//

import XCTest
import Fizmo

final class DirectionTests: XCTestCase {
    var land: Direction {
        Direction(id: "land", synonyms: "LAND")
    }
    var directions: [Direction] {
        Direction.defaults + [land]
    }

    func testPredefinedDirections() throws {
        XCTAssertEqual(directions.find("NORTH"), .north)
        XCTAssertEqual(directions.find("N"), .north)
        XCTAssertEqual(directions.find("EAST"), .east)
        XCTAssertEqual(directions.find("E"), .east)
        XCTAssertEqual(directions.find("WEST"), .west)
        XCTAssertEqual(directions.find("W"), .west)
        XCTAssertEqual(directions.find("SOUTH"), .south)
        XCTAssertEqual(directions.find("S"), .south)
        XCTAssertEqual(directions.find("NORTHEAST"), .northEast)
        XCTAssertEqual(directions.find("NE"), .northEast)
        XCTAssertEqual(directions.find("NORTHWEST"), .northWest)
        XCTAssertEqual(directions.find("NW"), .northWest)
        XCTAssertEqual(directions.find("SOUTHEAST"), .southEast)
        XCTAssertEqual(directions.find("SE"), .southEast)
        XCTAssertEqual(directions.find("SOUTHWEST"), .southWest)
        XCTAssertEqual(directions.find("SW"), .southWest)
        XCTAssertEqual(directions.find("UP"), .up)
        XCTAssertEqual(directions.find("U"), .up)
        XCTAssertEqual(directions.find("DOWN"), .down)
        XCTAssertEqual(directions.find("D"), .down)
        XCTAssertEqual(directions.find("IN"), .in)
        XCTAssertEqual(directions.find("OUT"), .out)
    }

    func testCustomDirection() throws {
        XCTAssertEqual(directions.find("LAND"), land)
    }
}

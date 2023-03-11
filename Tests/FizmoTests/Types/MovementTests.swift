//
//  MovementTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/15/23.
//

import CustomDump
import Fizmo
import XCTest

final class MovementTests: FizmoTests {
    // MARK: - Blocked

    var blocked: Movement {
        .blocked("There is no tree here suitable for climbing.")
    }
    var blockedJSON: String {
        """
        {
          "blocked" : {
            "_0" : "There is no tree here suitable for climbing."
          }
        }
        """
    }

    func testMovementBlockedEncoding() throws {
        XCTAssertNoDifference(
            try blocked.encoded().json,
            blockedJSON
        )
    }

    func testMovementBlockedDecoding() throws {
        XCTAssertNoDifference(
            try blockedJSON.decoded(),
            blocked
        )
    }

    // MARK: - Conditional

    var conditional: Movement {
        .conditional("kitchen", if: "kitchenWindowOpen")
    }
    var conditionalJSON: String {
        """
        {
          "conditional" : {
            "_0" : "kitchen",
            "if" : "kitchenWindowOpen"
          }
        }
        """
    }

    func testMovementConditionalEncoding() throws {
        XCTAssertNoDifference(
            try conditional.encoded().json,
            conditionalJSON
        )
    }

    func testMovementConditionalDecoding() throws {
        XCTAssertNoDifference(
            try conditionalJSON.decoded(),
            conditional
        )
    }

    // MARK: - ConditionalElse

    var conditionalElse: Movement {
        .conditionalElse(
            "studio",
            if: "falseFlag",
            else: "Only Santa Claus climbs down chimneys."
        )
    }
    var conditionalElseJSON: String {
        """
        {
          "conditionalElse" : {
            "_0" : "studio",
            "else" : "Only Santa Claus climbs down chimneys.",
            "if" : "falseFlag"
          }
        }
        """
    }

    func testMovementConditionalElseEncoding() throws {
        XCTAssertNoDifference(
            try conditionalElse.encoded().json,
            conditionalElseJSON
        )
    }

    func testMovementConditionalElseDecoding() throws {
        XCTAssertNoDifference(
            try conditionalElseJSON.decoded(),
            conditionalElse
        )
    }

    // MARK: - Per

    var perTrapDoorExit: Movement {
        .per("trapDoorExit")
    }
    var perTrapDoorExitJSON: String {
        """
        {
          "per" : {
            "_0" : "trapDoorExit"
          }
        }
        """
    }

    func testMovementPerEncoding() throws {
        XCTAssertNoDifference(
            try perTrapDoorExit.encoded().json,
            perTrapDoorExitJSON
        )
    }

    func testMovementPerDecoding() throws {
        XCTAssertNoDifference(
            try perTrapDoorExitJSON.decoded(),
            perTrapDoorExit
        )
    }

    // MARK: - To

    var toWestOfHouse: Movement {
        .to("westOfHouse")
    }
    var toWestOfHouseJSON: String {
        """
        {
          "to" : {
            "_0" : "westOfHouse"
          }
        }
        """
    }

    func testMovementToEncoding() throws {
        XCTAssertNoDifference(
            try toWestOfHouse.encoded().json,
            toWestOfHouseJSON
        )
    }

    func testMovementToDecoding() throws {
        XCTAssertNoDifference(
            try toWestOfHouseJSON.decoded(),
            toWestOfHouse
        )
    }
}

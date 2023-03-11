//
//  GlobalsTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/11/23.
//

import CustomDump
import Fizmo
import Identity
import XCTest

final class GlobalsTests: FizmoTests {
    var global: Globals { MicroCosm.shared.globals }

    func testGlobals() {
        XCTAssertNoDifference(global.score, 0)
        XCTAssertNil(global.winner)
        XCTAssertFalse(global.wonFlag)
    }

    func testGlobalScoreMutation() {
        XCTAssertNoDifference(global.score, 0)

        global.score += 10
        XCTAssertNoDifference(global.score, 10)

        global.score = 0
        XCTAssertNoDifference(global.score, 0)
    }

    func testGlobalWinnerMutation() {
        XCTAssertNil(global.winner)

        global.winner = MicroCosm.shared.objects.mailbox
        XCTAssertNoDifference(global.winner, MicroCosm.shared.objects.mailbox)

        global.winner = nil
        XCTAssertNil(global.winner)
    }

    func testGlobalWonFlagMutation() {
        XCTAssertFalse(global.wonFlag)

        global.wonFlag = true
        XCTAssertTrue(global.wonFlag)

        global.wonFlag = false
        XCTAssertFalse(global.wonFlag)
    }
}

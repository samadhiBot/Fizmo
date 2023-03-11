//
//  ObjectsTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/11/23.
//

import CustomDump
import Fizmo
import Identity
import XCTest

final class ObjectsTests: FizmoTests {
    var global: Globals { MicroCosm.shared.globals }
    var object: Objects { MicroCosm.shared.objects }

    func testObjects() {
        XCTAssertNoDifference(object.mailbox.id, "mailbox")
        XCTAssertNoDifference(object.mailbox.action, "mailboxFunc")
    }

    func testAction() throws {
        let action = try XCTUnwrap(object.jackpot.action)
        let actionFunc = try XCTUnwrap(MicroCosm.shared.actions[action])

        guard case .voidBool(let incrementScore) = actionFunc else {
            XCTFail("Didn't find incrementScore function")
            return
        }

        XCTAssertNoDifference(global.score, 0)
        let result = incrementScore()
        XCTAssertTrue(result)
        XCTAssertNoDifference(global.score, 1)

        global.score = 0
    }
}

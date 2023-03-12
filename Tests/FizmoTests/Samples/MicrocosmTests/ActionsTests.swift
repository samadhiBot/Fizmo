//
//  ActionsTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/11/23.
//

import CustomDump
import Fizmo
import Identity
import XCTest

final class ActionsTests: FizmoTests {
    func testActions() throws {
        let action = try XCTUnwrap(shared.objects.mailbox.action)
        let function = try XCTUnwrap(shared.actions[action])
        guard case .voidVoid(let mailboxFunc) = function else {
            XCTFail("Didn't find mailboxFunc")
            return
        }
        mailboxFunc()
    }
}

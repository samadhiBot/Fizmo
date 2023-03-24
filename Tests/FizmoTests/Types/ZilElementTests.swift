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
    func testExpressibleByBooleanLiteral() {
        let isFalse: ZilElement = false
        let isTrue: ZilElement = true

        XCTAssertNoDifference(isFalse, .bool(false))
        XCTAssertNoDifference(isTrue, .bool(true))
    }

    func testExpressibleByIntegerLiteral() {
        let fortyTwo: ZilElement = 42

        XCTAssertNoDifference(fortyTwo, .int(42))
    }

    func ExpressibleByStringLiteral() {
        let fortyTwo: ZilElement = "Forty-two"

        XCTAssertNoDifference(fortyTwo, .string("Forty-two"))
    }
}

//
//  RepeatTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 4/23/22.
//

import CustomDump
import XCTest
import Fizmo

final class RepeatTests: XCTestCase {
    let isFunnyReturn: Bool = true

    // https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.hkkpf6

    /// The `repeat1` (REPEAT-1) routine.
    func repeat1() {
        output("START: ")
        var x: Int = 0
        while true {
            /* X is not reinitialized between iterations. Default ACTIVATION created. */
            x.set(to: x.add(1))
            output(x)
            output(" ")
            if x.equals(3) {
                break
            }
            /* Bare RETURN without ACTIVATION will exit BLOCK */
        }
        output("RETURN EXIT BLOCK")
    }

    func testRepeat1() {
        repeat1()

        XCTAssertNoDifference(
            outputFlush(),
            "START: 1 2 3 RETURN EXIT BLOCK"
        )
    }

    @discardableResult
    /// The `repeat2` (REPEAT-2) routine.
    func repeat2() -> Bool {
        output("START: ")
        var x: Int = 0
        while true {
            /* X is not reinitialized between iterations. Default ACTIVATION created. */
            x.set(to: x.add(1))
            output(x)
            output(" ")
            if x.equals(3) {
                if isFunnyReturn {
                    output("RETURN EXIT ROUTINE")
                }
                return true
            }
            /* RETURN with value but without ACTIVATION will exit ROUTINE (FUNNY-RETURN = TRUE) */
        }
        // output("RETURN EXIT BLOCK") "Will never be executed"
    }
    // "START: 1 2 3 RETURN EXIT BLOCK"

    func testRepeat2() {
        repeat2()

        XCTAssertNoDifference(
            outputFlush(),
            "START: 1 2 3 RETURN EXIT ROUTINE"
        )
    }
}

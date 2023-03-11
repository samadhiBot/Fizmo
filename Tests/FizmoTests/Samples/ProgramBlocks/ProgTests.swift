//
//  ProgTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 4/23/22.
//

import CustomDump
import XCTest
import Fizmo

final class ProgTests: FizmoTests {
    let isFunnyReturn: Bool = true

    // https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.1bkyn9b

    /// The `prog1` (PROG-1) routine.
    func prog1() {
        var x: Int = 0
        x.set(to: 2)
        output("START: ")
        do {
            var x: Int = 0
            x.set(to: 1)
            output(x)
            output(" ")
            /* Inner X */
        }
        output(x)
        /* Outer X */
        output(" END")
    }

    func testProg1() {
        prog1()

        XCTAssertNoDifference(outputFlush(), "START: 1 2 END")
    }

    /// The `prog2` (PROG-2) routine.
    func prog2() {
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
            continue
            /* AGAIN without ACTIVATION will redo BLOCK */
        }
        output("RETURN EXIT BLOCK")
    }

    func testProg2() {
        prog2()

        XCTAssertNoDifference(outputFlush(), "START: 1 2 3 RETURN EXIT BLOCK")
    }

    @discardableResult
    /// The `prog3` (PROG-3) routine.
    func prog3() -> Bool {
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
            continue
            /* AGAIN without ACTIVATION will redo BLOCK */
        }
        // output("RETURN EXIT BLOCK") "Will never be executed"
    }
    // "START: 1 2 3 RETURN EXIT BLOCK"

    func testProg3() {
        prog3()

        XCTAssertNoDifference(outputFlush(), "START: 1 2 3 RETURN EXIT ROUTINE")
    }
}

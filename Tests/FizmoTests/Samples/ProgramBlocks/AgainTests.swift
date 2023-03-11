//
//  AgainTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 4/23/22.
//

import CustomDump
import XCTest
import Fizmo

final class AgainTests: FizmoTests {
    // https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.1au1eum

    /// The `again1` (AGAIN-1) routine.
    func again1() {
        var x: Int = 0
        while true {
            x.set(to: x.add(1))
            output(x)
            output(" ")
            if x.equals(5) {
                break
            }
            continue
            /* Start routine again, X keeps value */
        }
    }

    func testAgain1() {
        again1()

        XCTAssertNoDifference(outputFlush(), "1 2 3 4 5 ")
    }

    /// The `again2` (AGAIN-2) routine.
    func again2() {
        while true {
            var x: Int = 0
            x.set(to: x.add(1))
            output(x)
            output(" ")
            if x.equals(5) {
                break
            }
            /* Never reached */
            continue
            /* Start routine again, X reinitialize to 0 */
        }
    }

    func testAgain2() {
        // `testAgain2()` is infinitely repeating 1's
    }

    /// The `again3` (AGAIN-3) routine.
    func again3() {
        var x: Int = 0
        act1: while true {
            x.set(to: x.add(1))
            output(x)
            output(" ")
            if x.equals(5) {
                break
            }
            continue act1
            /* Start block again from ACT1, */
        }
    }

    func testAgain3() {
        again3()

        XCTAssertNoDifference(outputFlush(), "1 2 3 4 5 ")
    }

    /// The `again4` (AGAIN-4) routine.
    func again4() {
        var x: Int = 0
        while true {
            /* PROG generates default activation */
            x.set(to: x.add(1))
            output(x)
            output(" ")
            if x.equals(5) {
                break
            }
            continue
            /* Start block again from PROG, */
        }
    }

    func testAgain4() {
        again4()

        XCTAssertNoDifference(outputFlush(), "1 2 3 4 5 ")
    }
}

//
//  BindTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 4/23/22.
//

import CustomDump
import XCTest
import Fizmo

final class BindTests: XCTestCase {
    // https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.12jfdx2

    /// The `bind1` (BIND-1) routine.
    func bind1() {
        var x: Int = 0
        output("START ")
        x.set(to: 1)
        do {
            var x: Int = 0
            x.set(to: 2)
            output(x)
            output(" ")
            /* --> 2 (Inner X) */
        }
        output(x)
        output(" ")
        /* --> 1 (Outer X) */
        output("END")
    }

    func testBind1() {
        bind1()

        XCTAssertNoDifference(outputFlush(), "START 2 1 END")
    }

    /// The `bind2` (BIND-2) routine.
    func bind2() {
        var x: Int = 0
        while true {
            output("START ")
            x.set(to: x.add(1))
            output(x)
            output(" ")
            if x.equals(3) {
                return
            }
            /* --> exit routine */
            continue
            /* --> top of routine */
        }
        output("END")
        /* Never reached */
    }

    func testBind2() {
        bind2()

        XCTAssertNoDifference(outputFlush(), "START 1 START 2 START 3 ")
    }
}

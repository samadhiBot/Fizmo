//
//  DefineTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 4/23/22.
//

import CustomDump
import XCTest
import Fizmo

final class DefineTests: XCTestCase {
    @discardableResult
    /// The `incForm` (INC-FORM) function.
    func incForm(a: Int) -> Int {
        var a = a
        return a.set(to: .add(1, a))
    }

    func testIncForm() {
        let result = incForm(a: 1)

        XCTAssertEqual(result, 2)
    }

    @discardableResult
    /// The `myadd` (MYADD) function.
    func myadd(x1: Int, x2: Int) -> Int {
        var x1 = x1
        return x1.add(x2)
    }

    func testMyadd() {
        let result = myadd(x1: 4, x2: 5)

        XCTAssertEqual(result, 9)
    }

    @discardableResult
    /// The `powerTo` (POWER-TO) function.
    func powerTo(x: Int, y: Int = 2) -> Int {
        if y.equals(0) {
            return 1
        }
        var z: Int = 1
        var i: Int = 0
        while true {
            z.set(to: z.multiply(x))
            i.set(to: i.add(1))
            if i.equals(y) {
                return z
            }
        }
    }

    func testPowerTo() {
        let result = powerTo(x: 3, y: 3)

        XCTAssertEqual(result, 27)
    }

    @discardableResult
    /// The `square` (SQUARE) function.
    func square(x: Int) -> Int {
        var x = x
        return x.multiply(x)
    }

    func testSquare() {
        let result = square(x: 5)

        XCTAssertEqual(result, 25)
    }
}

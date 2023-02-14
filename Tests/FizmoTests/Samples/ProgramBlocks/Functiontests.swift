//
//  Functiontests.swift
//  Fizmo
//
//  Created by Chris Sessions on 7/3/22.
//

import CustomDump
import XCTest
import Fizmo

final class Functiontests: XCTestCase {
    func testSimpleAddFunction() {
        let addFunction: () -> Int = {
            var x: Int = 1
            let y: Int = 2
            return x.add(y)
        }

        XCTAssertNoDifference(addFunction(), 3)
    }

//    func testAAAAD() {
//        let square: Int = { (x: Int) -> Int in
//            var x = x
//            return x.multiply(x)
//        }
//    }
}

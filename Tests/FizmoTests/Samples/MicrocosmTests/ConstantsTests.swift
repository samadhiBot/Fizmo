//
//  ConstantsTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/15/23.
//

import CustomDump
import Fizmo
import Identity
import XCTest

final class ConstantsTests: FizmoTests {
    var constant: Constants { MicroCosm.shared.constants }

    func testConstants() {
        XCTAssertNoDifference(constant.strengthMax, 7)
        XCTAssertNoDifference(constant.strengthMin, 2)
    }
}

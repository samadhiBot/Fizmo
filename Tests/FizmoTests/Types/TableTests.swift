//
//  TableTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 6/1/22.
//

import CustomDump
import XCTest
import Fizmo

final class TableTests: FizmoTests {
    func testTable() throws {
        var rooms = Table(
            .room("forest1"),
            .room("forest2"),
            .room("forest3")
        )

        XCTAssertNoDifference(
            try rooms.get(at: 0),
            .room("forest1")
        )

        XCTAssertNoDifference(
            try rooms.get(at: 1),
            .room("forest2")
        )

        XCTAssertNoDifference(
            try rooms.put(element: .room("clearing"), at: 0),
            .room("clearing")
        )

        XCTAssertNoDifference(
            try rooms.get(at: 0),
            .room("clearing")
        )

        XCTAssertThrowsError(
            try rooms.get(at: 3),
            "Out of range: elements count is 3, so max read index is 2."
        )

        XCTAssertThrowsError(
            try rooms.put(element: .room("path"), at: 4),
            "Out of range: elements count is 3, so max write index is 3."
        )

        XCTAssertNoDifference(
            try rooms.put(element: .room("path"), at: 3),
            .room("path")
        )

        XCTAssertEqual(rooms.count, 4)
    }

    func testTableWithLengthFlag() throws {
        var rooms = Table(
            .room("forest1"),
            .room("forest2"),
            .room("forest3"),
            .room("path"),
            .room("clearing"),
            .room("forest1"),
            flags: .length
        )

        XCTAssertNoDifference(
            try rooms.get(at: 0),
            .int(6)
        )

        XCTAssertNoDifference(
            try rooms.get(at: 1),
            .room("forest1")
        )

        XCTAssertThrowsError(
            try rooms.put(element: .room("path"), at: 0),
            "Index 0 is the length flag; cannot write to that index."
        )

        XCTAssertThrowsError(
            try rooms.get(at: 7),
            "Out of range: elements count is 6, so max read index is 6."
        )

        XCTAssertThrowsError(
            try rooms.put(element: .room("path"), at: 8),
            "Out of range: elements count is 6, so max write index is 7."
        )

        XCTAssertNoDifference(
            try rooms.put(element: .room("path"), at: 7),
            .room("path")
        )

        XCTAssertNoDifference(
            try rooms.get(at: 0),
            .int(7)
        )

        XCTAssertEqual(rooms.count, 7)
    }

    func testImmutableTable() throws {
        var rooms = Table(
            .room("forest1"),
            .room("forest2"),
            .room("forest3"),
            .room("path"),
            .room("clearing"),
            .room("forest1"),
            flags: .pure
        )

        XCTAssertNoDifference(
            try rooms.get(at: 0),
            .room("forest1")
        )

        XCTAssertNoDifference(
            try rooms.get(at: 1),
            .room("forest2")
        )

        XCTAssertThrowsError(
            try rooms.put(element: .room("clearing"), at: 1),
            "Table is not mutable."
        )

        XCTAssertEqual(rooms.count, 6)
    }

    func testImmutableTableWithLengthFlag() throws {
        var rooms = Table(
            .room("forest1"),
            .room("forest2"),
            .room("forest3"),
            flags: .pure, .length
        )

        XCTAssertNoDifference(
            try rooms.get(at: 0),
            .int(3)
        )

        XCTAssertNoDifference(
            try rooms.get(at: 1),
            .room("forest1")
        )

        XCTAssertThrowsError(
            try rooms.put(element: .room("clearing"), at: 1),
            "Table is not mutable."
        )

        XCTAssertEqual(rooms.count, 3)
    }

    func testTableWithByteAndLengthFlags() throws {
        let integers = Table(
            .int8(1),
            .int8(2),
            .int8(3),
            .int8(4),
            flags: .byte, .length
        )

        XCTAssertNoDifference(try integers.get(at: 0), .int(4))
        XCTAssertNoDifference(try integers.get(at: 1), .int8(1))
        XCTAssertNoDifference(try integers.get(at: 2), .int8(2))
        XCTAssertNoDifference(try integers.get(at: 3), .int8(3))
        XCTAssertNoDifference(try integers.get(at: 4), .int8(4))
        XCTAssertThrowsError(try integers.get(at: 5), "Table only has 4 elements.")
        XCTAssertEqual(integers.count, 4)
    }

    func testTableOfFourImpliedZeros() throws {
        let fourZeros = Table(count: 4)

        XCTAssertNoDifference(try fourZeros.get(at: 0), .int(0))
        XCTAssertNoDifference(try fourZeros.get(at: 1), .int(0))
        XCTAssertNoDifference(try fourZeros.get(at: 2), .int(0))
        XCTAssertNoDifference(try fourZeros.get(at: 3), .int(0))
        XCTAssertThrowsError(try fourZeros.get(at: 4), "Table only has 4 elements.")
        XCTAssertEqual(fourZeros.count, 4)
    }

    func testTableOfFourZeros() throws {
        let fourZeros = Table(
            count: 4,
            defaults: .int(0)
        )

        XCTAssertNoDifference(try fourZeros.get(at: 0), .int(0))
        XCTAssertNoDifference(try fourZeros.get(at: 1), .int(0))
        XCTAssertNoDifference(try fourZeros.get(at: 2), .int(0))
        XCTAssertNoDifference(try fourZeros.get(at: 3), .int(0))
        XCTAssertThrowsError(try fourZeros.get(at: 4), "Table only has 4 elements.")
        XCTAssertEqual(fourZeros.count, 4)
    }

    func testTableByteLengthFourZeros() throws {
        let fourZeros = Table(
            count: 4,
            defaults: .int8(0),
            flags: .byte, .length
        )

        XCTAssertNoDifference(try fourZeros.get(at: 0), .int(4))
        XCTAssertNoDifference(try fourZeros.get(at: 1), .int8(0))
        XCTAssertNoDifference(try fourZeros.get(at: 2), .int8(0))
        XCTAssertNoDifference(try fourZeros.get(at: 3), .int8(0))
        XCTAssertNoDifference(try fourZeros.get(at: 4), .int8(0))
        XCTAssertThrowsError(try fourZeros.get(at: 5), "Table only has 5 elements.")
        XCTAssertEqual(fourZeros.count, 4)
    }

    func testTableNoneOneHundredZeros() throws {
        let oneHundredZeros = Table(
            count: 100,
            flags: .none
        )

        XCTAssertNoDifference(try oneHundredZeros.get(at: 0), .int(0))
        XCTAssertNoDifference(try oneHundredZeros.get(at: 99), .int(0))
        XCTAssertThrowsError(try oneHundredZeros.get(at: 100), "Table only has 100 elements.")
        XCTAssertEqual(oneHundredZeros.count, 100)
    }

    func testTableNoneGlobalBytes() throws {
        let readbufSize = 100

        let oneHundredZeros = Table(
            count: readbufSize,
            flags: .byte, .none
        )

        XCTAssertNoDifference(try oneHundredZeros.get(at: 0), .int(0))
        XCTAssertNoDifference(try oneHundredZeros.get(at: 99), .int(0))
        XCTAssertThrowsError(try oneHundredZeros.get(at: 100), "Table only has 100 elements.")
        XCTAssertEqual(oneHundredZeros.count, 100)
    }

    func testTableOfRepeatingDefaults() throws {
        let oneTwoThrees = Table(
            count: 5,
            defaults: .int(1), .int(2), .int(3)
        )

        XCTAssertNoDifference(try oneTwoThrees.get(at: 0), .int(1))
        XCTAssertNoDifference(try oneTwoThrees.get(at: 1), .int(2))
        XCTAssertNoDifference(try oneTwoThrees.get(at: 2), .int(3))
        XCTAssertNoDifference(try oneTwoThrees.get(at: 3), .int(1))
        XCTAssertNoDifference(try oneTwoThrees.get(at: 4), .int(2))
        XCTAssertThrowsError(try oneTwoThrees.get(at: 5), "Table only has 5 elements.")
    }
}

// MARK: - Special initializer tests

extension TableTests {
    func testBooleanInitializer() {
        XCTAssertNoDifference(
            Table(true, false, true),
            Table(
                .bool(true),
                .bool(false),
                .bool(true)
            )
        )
    }

    func testBooleanInitializerWithFlags() {
        XCTAssertNoDifference(
            Table(true, false, true, flags: .pure, .length),
            Table(
                .bool(true),
                .bool(false),
                .bool(true),
                flags: .pure, .length
            )
        )
    }

    func testIntegersInitializer() {
        XCTAssertNoDifference(
            Table(1, 2, 3),
            Table(
                .int(1),
                .int(2),
                .int(3)
            )
        )
    }

    func testIntegersInitializerWithFlags() {
        XCTAssertNoDifference(
            Table(1, 2, 3, flags: .pure, .length),
            Table(
                .int(1),
                .int(2),
                .int(3),
                flags: .pure, .length
            )
        )
    }

    func testStringInitializer() {
        XCTAssertNoDifference(
            Table("one", "two", "three"),
            Table(
                .string("one"),
                .string("two"),
                .string("three")
            )
        )
    }

    func testStringInitializerWithFlags() {
        XCTAssertNoDifference(
            Table("one", "two", "three", flags: .pure, .length),
            Table(
                .string("one"),
                .string("two"),
                .string("three"),
                flags: .pure, .length
            )
        )
    }
}

/* More table test subjects:

 <TABLE (BYTE LENGTH) 1 2 3 4>
 <TABLE 0 #BYTE 0 #BYTE 0>

 <ITABLE 4 0>
 <ITABLE (BYTE LENGTH) 4 0>
 <ITABLE BYTE 4 0>
 <ITABLE NONE 100>
 <ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0>
 <ITABLE NONE ,READBUF-SIZE (BYTE)>
 */

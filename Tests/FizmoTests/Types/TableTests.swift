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
        var foo = Table(
            .room(forest1),
            .room(forest2),
            .room(forest3)
        )

        XCTAssertNoDifference(
            try foo.get(at: 0),
            .room(forest1)
        )

        XCTAssertNoDifference(
            try foo.get(at: 1),
            .room(forest2)
        )

        XCTAssertNoDifference(
            try foo.put(element: .room(clearing), at: 0),
            .room(clearing)
        )

        XCTAssertNoDifference(
            try foo.get(at: 0),
            .room(clearing)
        )

        XCTAssertThrowsError(
            try foo.get(at: 3),
            "Out of range: elements count is 3, so max read index is 2."
        )

        XCTAssertThrowsError(
            try foo.put(element: .room(path), at: 4),
            "Out of range: elements count is 3, so max write index is 3."
        )

        XCTAssertNoDifference(
            try foo.put(element: .room(path), at: 3),
            .room(path)
        )

        XCTAssertEqual(foo.count, 4)
    }

    func testTableWithLengthFlag() throws {
        var foo = Table(
            .room(forest1),
            .room(forest2),
            .room(forest3),
            .room(path),
            .room(clearing),
            .room(forest1),
            flags: [.length]
        )

        XCTAssertNoDifference(
            try foo.get(at: 0),
            .int(6)
        )

        XCTAssertNoDifference(
            try foo.get(at: 1),
            .room(forest1)
        )

        XCTAssertThrowsError(
            try foo.put(element: .room(path), at: 0),
            "Index 0 is the length flag; cannot write to that index."
        )

        XCTAssertThrowsError(
            try foo.get(at: 7),
            "Out of range: elements count is 6, so max read index is 6."
        )

        XCTAssertThrowsError(
            try foo.put(element: .room(path), at: 8),
            "Out of range: elements count is 6, so max write index is 7."
        )

        XCTAssertNoDifference(
            try foo.put(element: .room(path), at: 7),
            .room(path)
        )

        XCTAssertNoDifference(
            try foo.get(at: 0),
            .int(7)
        )

        XCTAssertEqual(foo.count, 7)
    }

    func testImmutableTable() throws {
        var foo = Table(
            .room(forest1),
            .room(forest2),
            .room(forest3),
            .room(path),
            .room(clearing),
            .room(forest1),
            flags: [.pure]
        )

        XCTAssertNoDifference(
            try foo.get(at: 0),
            .room(forest1)
        )

        XCTAssertNoDifference(
            try foo.get(at: 1),
            .room(forest2)
        )

        XCTAssertThrowsError(
            try foo.put(element: .room(clearing), at: 1),
            "Table is not mutable."
        )

        XCTAssertEqual(foo.count, 6)
    }

    func testImmutableTableWithLengthFlag() throws {
        var foo = Table(
            .room(forest1),
            .room(forest2),
            .room(forest3),
            flags: [.pure, .length]
        )

        XCTAssertNoDifference(
            try foo.get(at: 0),
            .int(3)
        )

        XCTAssertNoDifference(
            try foo.get(at: 1),
            .room(forest1)
        )

        XCTAssertThrowsError(
            try foo.put(element: .room(clearing), at: 1),
            "Table is not mutable."
        )

        XCTAssertEqual(foo.count, 3)
    }

    func testTableWithByteAndLengthFlags() throws {
        let foo = Table(
            .int8(1),
            .int8(2),
            .int8(3),
            .int8(4),
            flags: [.byte, .length]
        )

        XCTAssertNoDifference(try foo.get(at: 0), .int(4))
        XCTAssertNoDifference(try foo.get(at: 1), .int8(1))
        XCTAssertNoDifference(try foo.get(at: 2), .int8(2))
        XCTAssertNoDifference(try foo.get(at: 3), .int8(3))
        XCTAssertNoDifference(try foo.get(at: 4), .int8(4))
        XCTAssertThrowsError(try foo.get(at: 5), "Table only has 4 elements.")
        XCTAssertEqual(foo.count, 4)
    }

    func testTableOfFourImpliedZeros() throws {
        let foo = Table(count: 4)

        XCTAssertNoDifference(try foo.get(at: 0), .int(0))
        XCTAssertNoDifference(try foo.get(at: 1), .int(0))
        XCTAssertNoDifference(try foo.get(at: 2), .int(0))
        XCTAssertNoDifference(try foo.get(at: 3), .int(0))
        XCTAssertThrowsError(try foo.get(at: 4), "Table only has 4 elements.")
        XCTAssertEqual(foo.count, 4)
    }

    func testTableOfFourZeros() throws {
        let foo = Table(
            count: 4,
            defaults: [.int(0)]
        )

        XCTAssertNoDifference(try foo.get(at: 0), .int(0))
        XCTAssertNoDifference(try foo.get(at: 1), .int(0))
        XCTAssertNoDifference(try foo.get(at: 2), .int(0))
        XCTAssertNoDifference(try foo.get(at: 3), .int(0))
        XCTAssertThrowsError(try foo.get(at: 4), "Table only has 4 elements.")
        XCTAssertEqual(foo.count, 4)
    }

    func testTableByteLengthFourZeros() throws {
        let foo = Table(
            count: 4,
            defaults: [.int(0)],
            flags: [.byte, .length]
        )

        XCTAssertNoDifference(try foo.get(at: 0), .int8(0))
        XCTAssertNoDifference(try foo.get(at: 1), .int8(0))
        XCTAssertNoDifference(try foo.get(at: 2), .int8(0))
        XCTAssertNoDifference(try foo.get(at: 3), .int8(0))
        XCTAssertThrowsError(try foo.get(at: 4), "Table only has 4 elements.")
        XCTAssertEqual(foo.count, 4)
    }

    func testTableNoneOneHundredZeros() throws {
        let foo = Table(
            count: 100,
            flags: [.none]
        )

        XCTAssertNoDifference(try foo.get(at: 0), .int(0))
        XCTAssertNoDifference(try foo.get(at: 99), .int(0))
        XCTAssertThrowsError(try foo.get(at: 100), "Table only has 100 elements.")
        XCTAssertEqual(foo.count, 100)
    }

    func testTableNoneGlobalBytes() throws {
        let readbufSize = 100

        let foo = Table(
            count: readbufSize,
            flags: [.byte, .none]
        )

        XCTAssertNoDifference(try foo.get(at: 0), .int(0))
        XCTAssertNoDifference(try foo.get(at: 99), .int(0))
        XCTAssertThrowsError(try foo.get(at: 100), "Table only has 100 elements.")
        XCTAssertEqual(foo.count, 100)
    }

    func testTableOfRepeatingDefaults() throws {
        let foo = Table(
            count: 5,
            defaults: [.int(1), .int(2), .int(3)]
        )

        XCTAssertNoDifference(try foo.get(at: 0), .int(1))
        XCTAssertNoDifference(try foo.get(at: 1), .int(2))
        XCTAssertNoDifference(try foo.get(at: 2), .int(3))
        XCTAssertNoDifference(try foo.get(at: 3), .int(1))
        XCTAssertNoDifference(try foo.get(at: 4), .int(2))
        XCTAssertThrowsError(try foo.get(at: 5), "Table only has 5 elements.")
    }

    func testTableRepeatingLexvDefaults() throws {
        let foo = Table(
            count: 59,
            defaults: [
                .int(0),
                .int8(0),
                .int8(0),
            ],
            flags: [.lexv]
        )

        XCTAssertNoDifference(
            try foo.get(at: 0),
            .lexv(Int16(0), Int8(0), Int8(0))
        )
        XCTAssertNoDifference(
            try foo.get(at: 58),
            .lexv(Int16(0), Int8(0), Int8(0))
        )
        XCTAssertThrowsError(try foo.get(at: 59), "Table only has 59 elements.")
        XCTAssertEqual(foo.count, 59)
    }
}


//<TABLE (BYTE LENGTH) 1 2 3 4>
//<TABLE 0 #BYTE 0 #BYTE 0>
//
//<ITABLE 4 0>
//<ITABLE (BYTE LENGTH) 4 0>
//<ITABLE BYTE 4 0>
//<ITABLE NONE 100>
//<ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0>
//<ITABLE NONE ,READBUF-SIZE (BYTE)>

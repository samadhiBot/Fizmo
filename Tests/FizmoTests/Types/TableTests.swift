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
        var foo: Table = Table(
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
    }

    func testTableWithLengthFlag() throws {
        var foo: Table = Table(
            .room(forest1),
            .room(forest2),
            .room(forest3),
            .room(path),
            .room(clearing),
            .room(forest1),
            hasLengthFlag: true
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
    }

    func testImmutableTable() throws {
        var foo: Table = Table(
            .room(forest1),
            .room(forest2),
            .room(forest3),
            .room(path),
            .room(clearing),
            .room(forest1),
            isMutable: false
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
    }

    func testImmutableTableWithLengthFlag() throws {
        var foo: Table = Table(
            .room(forest1),
            .room(forest2),
            .room(forest3),
            isMutable: false,
            hasLengthFlag: true
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
    }

}

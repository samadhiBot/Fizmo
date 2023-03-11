//
//  BeerSongTests.swift
//  BeerSong
//
//  Created by Chris Sessions on 3/23/22.
//

import CustomDump
import XCTest
import Fizmo

final class BeerSongTests: FizmoTests {
    func testBeerSongRoutineVersion() {
        let song = BeerSong.RoutineVersion()
        song.go()

        XCTAssertNoDifference(outputFlush(), BeerSong.lyrics)
        XCTAssertEqual(outputFlush(), "")
    }

    func testBeerSongMacroVersion() {
        let song = BeerSong.MacroVersion()
        song.go()

        XCTAssertNoDifference(outputFlush(), BeerSong.lyrics)
        XCTAssertEqual(outputFlush(), "")
    }
}

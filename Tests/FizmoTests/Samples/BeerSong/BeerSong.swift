//
//  BeerSong.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/24/22.
//

import Fizmo
import Foundation

// https://foss.heptapod.net/zilf/zilf/-/blob/branch/default/sample/beer/beer.zil

enum BeerSong {
    static let lyrics = """
        3 bottles of beer on the wall,
        3 bottles of beer,
        Take one down, pass it around,
        2 bottles of beer on the wall!

        2 bottles of beer on the wall,
        2 bottles of beer,
        Take one down, pass it around,
        1 bottle of beer on the wall!

        1 bottle of beer on the wall,
        1 bottle of beer,
        Take one down, pass it around,
        No more bottles of beer on the wall!

        """
}

// MARK: - BeerSong.MacroVersion

extension BeerSong {
    struct MacroVersion {
        /// The `bottles` (BOTTLES) macro.
        func bottles(n: Int) {
            do {
                output(n)
                output(" bottle")
                if n.isNotEqualTo(1) {
                    output("s")
                }
            }
        }

        /// The `go` (GO) routine.
        func go() {
            sing(n: 3)
        }

        @discardableResult
        /// The `sing` (SING) routine.
        func sing(n: Int) -> Bool {
            var n = n
            while true {
                bottles(n: n)
                output("""
                     of beer on the wall,

                    """)
                bottles(n: n)
                output("""
                     of beer,
                    Take one down, pass it around,

                    """)
                if n.decrement().isLessThan(1) {
                    output("No more bottles of beer on the wall!")
                    output("\n")
                    return true
                } else {
                    bottles(n: n)
                    output("""
                         of beer on the wall!


                        """)
                }
            }
        }
    }
}

// MARK: - BeerSong.RoutineVersion

extension BeerSong {
    struct RoutineVersion {
        @discardableResult
        /// The `bottles` (BOTTLES) routine.
        func bottles(n: Int) -> Bool {
            output(n)
            output(" bottle")
            if n.isNotEqualTo(1) {
                output("s")
            }
            return true
        }

        @discardableResult
        /// The `go` (GO) routine.
        func go() -> Bool {
            return sing(n: 3)
        }

        @discardableResult
        /// The `sing` (SING) routine.
        func sing(n: Int) -> Bool {
            var n = n
            while true {
                bottles(n: n)
                output("""
                     of beer on the wall,

                    """)
                bottles(n: n)
                output("""
                     of beer,
                    Take one down, pass it around,

                    """)
                if n.decrement().isLessThan(1) {
                    output("No more bottles of beer on the wall!")
                    output("\n")
                    return true
                } else {
                    bottles(n: n)
                    output("""
                         of beer on the wall!


                        """)
                }
            }
        }
    }
}

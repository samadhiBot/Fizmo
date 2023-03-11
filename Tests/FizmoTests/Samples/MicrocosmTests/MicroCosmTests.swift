//
//  MicroCosmTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/18/23.
//

import CustomDump
import Fizmo
import XCTest

//final class MicroCosmTests: FizmoTests {
//    func testWorldDecoding() throws {
//        XCTAssertNoDifference(
//            try worldJSON.decoded(),
//            world
//        )
//    }
//
//    func testWorldEncoding() throws {
//        let encoded = try world.encoded().json
//
//        XCTAssertNoDifference(
//            try encoded.decoded(),
//            world
//        )
//    }
//}
//
//// MARK: - Test helpers
//
//extension WorldTests {
////    var world: MicroCosm.World {
////        MicroCosm.shared.world
////    }
//
//    var worldJSON: String {
//        """
//        {
//          "globals" : {
//            "wonFlag" : false
//          },
//          "objects" : {
//            "mailbox" : {
//              "action" : "mailboxFunc",
//              "adjectives" : [
//                "small"
//              ],
//              "capacity" : 10,
//              "directions" : [
//
//              ],
//              "id" : "mailbox"
//            },
//            "rooms" : {
//              "adjectives" : [
//
//              ],
//              "directions" : [
//                "in",
//                {
//                  "to" : {
//                    "_0" : "rooms"
//                  }
//                }
//              ],
//              "id" : "rooms"
//            }
//          },
//          "rooms" : {
//            "westOfHouse" : {
//              "action" : "westHouse",
//              "adjectives" : [
//
//              ],
//              "directions" : [
//                "east",
//                {
//                  "blocked" : {
//                    "_0" : "The door is boarded and you can't remove the boards."
//                  }
//                },
//                "southEast",
//                {
//                  "to" : {
//                    "_0" : "southOfHouse"
//                  }
//                },
//                "southWest",
//                {
//                  "conditional" : {
//                    "_0" : "stoneBarrow",
//                    "if" : "wonFlag"
//                  }
//                },
//                "in",
//                {
//                  "conditional" : {
//                    "_0" : "stoneBarrow",
//                    "if" : "wonFlag"
//                  }
//                },
//                "south",
//                {
//                  "to" : {
//                    "_0" : "southOfHouse"
//                  }
//                },
//                "west",
//                {
//                  "to" : {
//                    "_0" : "forest1"
//                  }
//                },
//                "northEast",
//                {
//                  "to" : {
//                    "_0" : "northOfHouse"
//                  }
//                },
//                "north",
//                {
//                  "to" : {
//                    "_0" : "northOfHouse"
//                  }
//                }
//              ],
//              "id" : "westOfHouse"
//            }
//          }
//        }
//        """
//    }
//}

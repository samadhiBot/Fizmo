//
//  FizmoTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 6/3/22.
//

import Fizmo
import XCTest

class FizmoTests: XCTestCase {
    var knife = Object(id: "knife")
    var sandwich = Object(id: "sandwich")
    var troll = Object(id: "troll")

    var clearing = Room(id: "clearing")
    var forest1 = Room(id: "forest1")
    var forest2 = Room(id: "forest2")
    var forest3 = Room(id: "forest3")
    var path = Room(id: "path")
}

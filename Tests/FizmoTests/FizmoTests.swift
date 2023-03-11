//
//  FizmoTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 6/3/22.
//

import Fizmo
import XCTest

class FizmoTests: XCTestCase {

    // MARK: - Directions

    lazy var land = Direction(
        id: "land",
        synonyms: "LAND"
    )
    lazy var landJSON = """
        {
          "id" : "land",
          "synonyms" : [
            "LAND"
          ]
        }
        """

    // MARK: - Objects

    lazy var knife = Object(
        id: "knife",
        action: "stabbyFunc",
        adjectives: ["Stiletto", "Dagger"],
        capacity: 1
    )
    lazy var knifeJSON = """
        {
          "action" : "stabbyFunc",
          "adjectives" : [
            "Stiletto",
            "Dagger"
          ],
          "capacity" : 1,
          "directions" : [

          ],
          "flags" : [

          ],
          "globals" : [

          ],
          "id" : "knife",
          "pseudos" : {

          },
          "synonyms" : [

          ],
          "things" : [

          ],
          "vehicleType" : false
        }
        """
    lazy var sandwich = Object(id: "sandwich")
    lazy var troll = Object(id: "troll")

    // MARK: - Rooms

    lazy var westOfHouse = Room(
        id: "westOfHouse",
        adjectives: ["Placeholder"],
        directions: [
            Direction.north: .to("northOfHouse"),
        ]
    )
    lazy var westOfHouseJSON = """
        {
          "adjectives" : [
            "Placeholder"
          ],
          "directions" : [
            "north",
            {
              "to" : {
                "_0" : "northOfHouse"
              }
            }
          ],
          "flags" : [

          ],
          "globals" : [

          ],
          "id" : "westOfHouse",
          "pseudos" : {

          },
          "synonyms" : [

          ],
          "things" : [

          ],
          "vehicleType" : false
        }
        """
    lazy var clearing = Room(id: "clearing")
    lazy var forest1 = Room(id: "forest1")
    lazy var forest2 = Room(id: "forest2")
    lazy var forest3 = Room(id: "forest3")
    lazy var path = Room(id: "path")
}

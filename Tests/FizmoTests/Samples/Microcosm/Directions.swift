//
//  Directions.swift
//  MicroCosm
//
//  Created by Chris Sessions on 2/21/23.
//

import Fizmo

enum Directions {
    static var combined: [Direction] {
        Direction.defaults +
        [
            Direction(id: "land", synonyms: "LAND"),
        ]
    }
}

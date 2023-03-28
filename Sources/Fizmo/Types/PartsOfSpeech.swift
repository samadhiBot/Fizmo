//
//  PartsOfSpeech.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/28/23.
//

import Foundation

/// Enumerates the Parts of Speech values as described in the Zil
/// [VOC](https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.4bewzdj)
/// function.
enum PartsOfSpeech: Int {
    case objectFirst = 0
    case verbFirst = 1
    case adjectiveFirst = 2
    case directionFirst = 3
    case buzzWord = 4
    case preposition = 8
    case direction = 16
    case adjective = 32
    case verb = 64
    case object = 128
}

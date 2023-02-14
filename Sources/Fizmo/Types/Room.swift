////
////  Room.swift
////  Fizmo
////
////  Created by Chris Sessions on 3/19/22.
////
//
//import Foundation
//
///// Rooms are distinct locations in the world.
//final public class Room: Object {
//    /// A dictionary containing each ``Direction`` and corresponding ``Movement`` that is possible
//    /// in the room.
//    public private(set) var directions: [Direction: Movement]
//
//    public init(
//        id: Room.Identifier,
//        action: Function? = nil,
//        adjectives: [String] = [],
//        flags: [Flag] = [],
//        capacity: Int? = nil,
//        description: String? = nil,
//        descriptionFunction: String? = nil,
//        directions: [Direction: Movement] = [:],
//        firstDescription: String? = nil,
//        globals: [Object] = [],
//        longDescription: String? = nil,
//        location: Room? = nil,
//        pseudos: [String: Function] = [:],
//        size: Int? = nil,
//        strength: Int? = nil,
//        synonyms: [String] = [],
//        takeValue: Int? = nil,
//        text: String? = nil,
//        vType: Flag? = nil,
//        value: Int? = nil
//    ) {
//        self.directions = directions
//        super.init(
//            id: id,
//            action: action,
//            adjectives: adjectives,
//            flags: flags,
//            capacity: capacity,
//            description: description,
//            descriptionFunction: descriptionFunction,
//            firstDescription: firstDescription,
//            globals: globals,
//            longDescription: longDescription,
//            parent: location,
//            pseudos: pseudos,
//            size: size,
//            strength: strength,
//            synonyms: synonyms,
//            takeValue: takeValue,
//            text: text,
//            vType: vType,
//            value: value
//        )
//    }
//}

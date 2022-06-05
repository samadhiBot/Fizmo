//
//  Flag.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import Foundation

/// A `Flag` specifies a special attribute of an ``Object``.
///
/// Detailed attribute descriptions are taken from
/// [Learning ZIL](https://archive.org/details/Learning_ZIL_Steven_Eric_Meretzky_1995/page/n60/mode/1up)
/// by Steve Meretzky (1995), or
/// [ZIL Course](https://github.com/ZoBoRf/ZILCourse/blob/master/ZILCourse.pdf)
/// by Marc Blank (1982).
///
public struct Flag: Equatable {
    /// The flag's unique identifier.
    public let id: Flag.Identifier

    /// The flag's original Zil value.
    let zil: String
}

// MARK: - Flag.Identifier

extension Flag {
    /// A unique flag identifier.
    public struct Identifier: Hashable {
        let rawValue: String
    }
}

extension Flag.Identifier: Comparable {
    public static func < (lhs: Flag.Identifier, rhs: Flag.Identifier) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Flag.Identifier: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}

extension Flag.Identifier: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    public init(stringLiteral value: String) {
        rawValue = value
    }
}

// MARK: - Predefined flags

extension Flag {
    /// The object's description begins with a vowel.
    ///
    /// "The object's DESC begins with a vowel; any verb default which prints an indefinite article
    /// before the DESC is warned to use 'an' instead of 'a'."
    public static let beginsWithVowel = Flag(id: "beginsWithVowel", zil: "VOWELBIT")

    /// The vehicle object should catch dropped items.
    ///
    /// "Found in vehicles, this not-very-important flag means that if the player drops something
    /// while in that vehicle, the object should stay in the vehicle rather than falling to the
    /// floor of the room itself."
    public static let catchesDroppedItems = Flag(id: "catchesDroppedItems", zil: "DROPBIT")

    /// The object has been touched, or the room has been visited.
    ///
    /// "In the case of a room, this means that the player has been to the room at least once.
    /// Obviously, no room should be defined with a TOUCHBIT, since at the beginning of the game,
    /// the player has not been in any room yet. In the case of an object, this means that the
    /// object has been taken or otherwise disturbed by the player; for example, once the TOUCHBIT
    /// of an object is set, if it has an FDESC, that FDESC will no longer be used to describe it."
    public static let hasBeenTouched = Flag(id: "hasBeenTouched", zil: "TOUCHBIT")

    /// The object is an actor.
    public static let isActor = Flag(id: "isActor", zil: "ACTORBIT")

    /// The object can be attacked.
    public static let isAttackable = Flag(id: "isAttackable", zil: "ATTACKBIT")

    /// The object is a being worn.
    ///
    /// "This means that a wearable object is currently being worn."
    public static let isBeingWorn = Flag(id: "isBeingWorn", zil: "WORNBIT")

    /// The object is a body part.
    ///
    /// "The object is a body part: the PIANDS object, for example."
    public static let isBodyPart = Flag(id: "isBodyPart", zil: "PARTBIT")

    /// The object can be burned.
    ///
    /// The object is burnable. Generally, most takeable objects which are made out of wood or paper
    /// should have the BURNBIT."
    public static let isBurnable = Flag(id: "isBurnable", zil: "BURNBIT")

    /// The object can be climbed.
    public static let isClimbable = Flag(id: "isClimbable", zil: "CLIMBBIT")

    /// The object is a container.
    ///
    /// "The object is a container; things can be put inside it, it can be opened and closed, etc."
    public static let isContainer = Flag(id: "isContainer", zil: "CONTBIT")

    /// The room has been destroyed.
    ///
    /// "One interesting note about ROOMs: they can be destroyed arbitrarily within the context of a
    /// game. This is done by setting the RMUNGBIT of the ROOM and changing the LDESC of the ROOM to
    /// be something appropriate to print whenever the ACTOR attempts to enter the ROOM. The WALK
    /// action checks for the RMUNGBIT and prints the appropriate message."
    public static let isDestroyed = Flag(id: "isDestroyed", zil: "RMUNGBIT")

    /// The object is a device.
    public static let isDevice = Flag(id: "isDevice", zil: "DEVICEBIT")

    /// The object is a door.
    ///
    /// "The object is a door and various routines, such as V-OPEN, should treat it as such."
    public static let isDoor = Flag(id: "isDoor", zil: "DOORBIT")

    /// The object is drinkable.
    public static let isDrinkable = Flag(id: "isDrinkable", zil: "DRINKBIT")

    /// The object is a rLand.
    ///
    /// "Usually used only for rooms, this bit lets any routine that cares know that the room is dry
    /// land (as most are)."
    public static let isDryLand = Flag(id: "isDryLand", zil: "RLANDBIT")

    /// The object is edible.
    public static let isEdible = Flag(id: "isEdible", zil: "EDIBLEBIT")

    /// The object is female.
    ///
    /// "The object is an ACTOR who is a female. Informs various routines to say 'she' instead of
    /// 'he'."
    public static let isFemale = Flag(id: "isFemale", zil: "FEMALEBIT")

    /// The object can be fought.
    public static let isFightable = Flag(id: "isFightable", zil: "FIGHTBIT")

    /// The object is flammable.
    ///
    /// "This means that the object is a source of fire. An object with the FLAMEBIT should also
    /// have the ONBIT (since it is providing light) and the LIGHTBIT (since it can be
    /// extinguished)."
    public static let isFlammable = Flag(id: "isFlammable", zil: "FLAMEBIT")

    /// The object is food.
    public static let isFood = Flag(id: "isFood", zil: "FOODBIT")

    /// Tells routines to say "in" instead of "on".
    ///
    /// "Another not-too-important vehicle-related flag, it tells various routines to say 'in the
    /// vehicle' rather than 'on the vehicle.'"
    public static let isInNotOn = Flag(id: "isInNotOn", zil: "INBIT")

    /// The object is an integral part of another object.
    ///
    /// "This means that the object is an integral part of some other object, and can't be
    /// independently taken or dropped. An example might be a dial or button on a (takeable) piece
    /// of equipment."
    public static let isIntegral = Flag(id: "isIntegral", zil: "INTEGRALBIT")

    /// The object is invisible.
    ///
    /// "One of the few bits that doesn't end in "-BIT," INVISIBLE tells the parser not to find this
    /// object. Usually, the intention is to clear the invisible at some point. For example, you
    /// might clear the invisible bit on the BLOOD-STAIN object after the player examines the
    /// bludgeon. Until that point, referring to the blood stain would get a response like 'You
    /// can't see any blood stain right here.'"
    public static let isInvisible = Flag(id: "isInvisible", zil: "INVISIBLE")

    /// The object can be a source of light.
    ///
    /// "The object is capable of being turned on and off, like the old brass lantern from Zork.
    /// However, it doesn't mean that the object is actually on."
    public static let isLight = Flag(id: "isLight", zil: "LIGHTBIT")

    /// The object is locked.
    ///
    /// "Tells routines like V-OPEN that an object or door is locked and can't be opened without
    /// proper equipment."
    public static let isLocked = Flag(id: "isLocked", zil: "LOCKEDBIT")

    /// The object is a maze.
    public static let isMaze = Flag(id: "isMaze", zil: "MAZEBIT")

    /// The room is a mid-air location.
    ///
    /// "The room is in mid-air, for those games with some type of flying."
    public static let isMidAirLocation = Flag(id: "isMidAirLocation", zil: "RAIRBIT")

    /// The object is a not land.
    public static let isNotLand = Flag(id: "isNotLand", zil: "NONLANDBIT")

    /// The object is turned on.
    ///
    /// In the case of a room, this means that the room is lit. If your game takes place during the
    /// day, any outdoor room should have the ONBIT. In the case of an object, this means that the
    /// object is providing light. An object with the ONBIT should also have the LIGHTBIT."
    public static let isOn = Flag(id: "isOn", zil: "ONBIT")

    /// The object is open.
    ///
    /// "The object is a door or container, and is open."
    public static let isOpen = Flag(id: "isOpen", zil: "OPENBIT")

    /// The object is openable.
    public static let isOpenable = Flag(id: "isOpenable", zil: "OPENABLEBIT")

    /// The room is an outside location.
    ///
    /// "Used in rooms to classify the room as an outdoors room."
    public static let isOutside = Flag(id: "isOutside", zil: "OUTSIDEBIT")

    /// The object is a person.
    ///
    /// "This means that the object is a character in the game, and such act accordingly. For
    /// example, they can be spoken to. This flag is sometimes called the ACTORBIT."
    public static let isPerson = Flag(id: "isPerson", zil: "PERSONBIT")

    /// The object's description is a plural noun or noun phrase.
    ///
    /// "The object's DESC is a plural noun or noun phrase, such as 'barking dogs,' and routines
    /// which use the DESC should act accordingly."
    public static let isPlural = Flag(id: "isPlural", zil: "PLURALBIT")

    /// The object is readable.
    ///
    /// "The object is readable. Any object with a TEXT property should have the READBIT."
    public static let isReadable = Flag(id: "isReadable", zil: "READBIT")

    /// The object is sacred.
    public static let isSacred = Flag(id: "isSacred", zil: "SACREDBIT")

    /// The object is searchable.
    ///
    /// "A very slippery concept. It tells the parser to look as deeply into a container as it can
    /// in order to find the referenced object. Without the SEARCHBIT, the parser will only look
    /// down two-levels. Example. There's a box on the ground; there's a bowl in the box; there's an
    /// apple in the bowl.
    ///
    /// "If the player says TAKE APPLE, and the box or the bowl have a SEARCHBIT, the apple will be
    /// found by the parser and then taken. If the player says TAKE APPLE, and the box and bowl
    /// don't have the SEARCHBIT, the parser will say "You can't see any apple right here." Frankly,
    /// I think the SEARCHBIT is a stupid concept, and I automatically give the SEARCHBIT to all
    /// containers."
    public static let isSearchable = Flag(id: "isSearchable", zil: "SEARCHBIT")

    /// The object is staggered.
    public static let isStaggered = Flag(id: "isStaggered", zil: "STAGGERED")

    /// The object is a surface.
    ///
    /// "The object is a surface, such as a table, desk, countertop, etc. Any object with the
    /// SURFACEBIT should also have the CONTBIT (since you can put things on the surface) and the
    /// OPENBIT (since you can't close a countertop as you can a box)."
    public static let isSurface = Flag(id: "isSurface", zil: "SURFACEBIT")

    /// The object can be taken.
    public static let isTakable = Flag(id: "isTakable", zil: "TAKEBIT")

    /// The object is a tool.
    public static let isTool = Flag(id: "isTool", zil: "TOOLBIT")

    /// The object is transparent.
    ///
    /// "The object is transparent; objects inside it can be seen even if it is closed."
    public static let isTransparent = Flag(id: "isTransparent", zil: "TRANSBIT")

    /// The object is turnable.
    public static let isTurnable = Flag(id: "isTurnable", zil: "TURNBIT")

    /// The object is a vehicle.
    ///
    /// "This means that the object is a vehicle, and can be entered or boarded by the player. All
    /// objects with the VEHBIT should usually have the CONTBIT and the OPENBIT."
    public static let isVehicle = Flag(id: "isVehicle", zil: "VEHBIT")

    /// The room is a water location.
    ///
    /// "The room is water rather than dry land, such as the River and Reservoir in Zork I. Some
    /// typical implications: The player can't go there without a boat; anyone dropped outside of
    /// the boat will sink and be lost, etc."
    public static let isWaterLocation = Flag(id: "isWaterLocation", zil: "RWATERBIT")

    /// The object is a weapon.
    public static let isWeapon = Flag(id: "isWeapon", zil: "WEAPONBIT")

    /// The object is wearable.
    ///
    /// "The object can be worn. Given to garments and wearable equipment such as jewelry or a
    /// diving helmet. Only means that the object is wearable, not that it is actually being worn."
    public static let isWearable = Flag(id: "isWearable", zil: "WEARBIT")

    /// The object should not be implicitly taken.
    ///
    /// "This bit tells the parser not to let the player implicitly take an object, as in:
    ///
    /// ```
    /// > READ DECREE
    /// [taking the decree first]
    /// ```
    ///
    /// "This is important if the object has a value and must be scored, or if the object has an
    /// NDESCBIT which must be cleared, or if you want taking the object to set a flag or queue a
    /// routine, or..."
    public static let noImplicitTake = Flag(id: "noImplicitTake", zil: "TRYTAKEBIT")

    /// The object omits an article.
    ///
    /// "The object's DESC doesn't not work with articles, and they should be omitted. An example is
    /// the ME object, which usually has the DESC 'you.' A verb default should say 'It smells just
    /// like you.' rather than 'It smells just like _a_ you.'"
    public static let omitArticle = Flag(id: "omitArticle", zil: "NARTICLEBIT")

    /// The object is a nounDescription.
    ///
    /// "The object shouldn't be described by the describers. This usually means that someone else,
    /// such as the room description, is describing the object. Any takeable object, once taken,
    /// should have its NDESCBIT cleared."
    public static let omitDescription = Flag(id: "omitDescription", zil: "NDESCBIT")

    /// The object should be omitted from "take all" operations.
    ///
    /// "This has something to do with telling a TAKE ALL not to take something, but I don't recall
    /// how it works. Help???"
    public static let omitFromTakeAll = Flag(id: "omitFromTakeAll", zil: "NALLBIT")

    /// Tells the parser not to complain when the player input is missing a noun.
    ///
    /// [kludge](https://www.lexico.com/en/definition/kludge) _noun_:
    ///
    /// 1. An ill-assorted collection of parts assembled to fulfill a particular purpose.
    /// 2. _Computing_ A machine, system, or program that has been badly put together.
    ///
    /// "This bit is used only in the syntax file. It is used for those syntaxes which want to be
    /// simply VERB PREPOSITION with no object. Put (FIND KLUDGEBIT) after the object. The parser,
    /// rather than complaining about the missing noun, will see the FIND KLUDGEBIT and set the PRSO
    /// (or PRSI as the case may be) to the ROOMS object. Some games use RLANDBIT instead of the
    /// KLUDGEBIT; this saves a bit, since the parser won't 'find' a room, and no objects have the
    /// RLANDBIT."
    public static let shouldKludge = Flag(id: "shouldKludge", zil: "KLUDGEBIT")
}

extension Flag {
    /// Attempts to find a predefined flag matching the specified Zil string, and returns it if
    /// found. Otherwise it returns a new custom `Flag` based on the specified values.
    ///
    /// - Parameters:
    ///   - id: A proposed identifier in the case of a new custom flag.
    ///   - zil: The flag's original Zil string value.
    ///
    /// - Returns: A predefined flag if a match was found, or a new custom `Flag` based on the
    ///            specified values.
    public static func find(
        id: String,
        zil: String
    ) -> Flag {
        if let flag = predefinedFlags.first(where: { $0.zil == zil }) {
            return flag
        }
        return Flag(
            id: .init(rawValue: id),
            zil: zil
        )
    }

    /// All of the predefined flags.
    private static var predefinedFlags: [Flag] = [
        beginsWithVowel,
        catchesDroppedItems,
        hasBeenTouched,
        isActor,
        isAttackable,
        isBeingWorn,
        isBodyPart,
        isBurnable,
        isClimbable,
        isContainer,
        isDestroyed,
        isDevice,
        isDoor,
        isDrinkable,
        isDryLand,
        isEdible,
        isFemale,
        isFightable,
        isFlammable,
        isFood,
        isInNotOn,
        isIntegral,
        isInvisible,
        isLight,
        isLocked,
        isMaze,
        isMidAirLocation,
        isNotLand,
        isOn,
        isOpen,
        isOpenable,
        isOutside,
        isPerson,
        isPlural,
        isReadable,
        isSacred,
        isSearchable,
        isStaggered,
        isSurface,
        isTakable,
        isTool,
        isTransparent,
        isTurnable,
        isVehicle,
        isWaterLocation,
        isWeapon,
        isWearable,
        noImplicitTake,
        omitArticle,
        omitDescription,
        omitFromTakeAll,
        shouldKludge,
    ]
}

// MARK: - Flag.Error

extension Flag {
    public enum Error: Swift.Error {
        case alreadyDefined
        case illegalEmptyFlag
    }
}

//
//  Object+Flags.swift
//  Fizmo
//
//  Created by Chris Sessions on 2/14/23.
//

import Foundation

extension Object {
    var beginsWithVowel: Bool {
        flags.contains(.beginsWithVowel)
    }

    var catchesDroppedItems: Bool {
        flags.contains(.catchesDroppedItems)
    }

    var hasBeenTouched: Bool {
        flags.contains(.hasBeenTouched)
    }

    var isActor: Bool {
        flags.contains(.isActor)
    }

    var isAttackable: Bool {
        flags.contains(.isAttackable)
    }

    var isBeingWorn: Bool {
        flags.contains(.isBeingWorn)
    }

    var isBodyPart: Bool {
        flags.contains(.isBodyPart)
    }

    var isBurnable: Bool {
        flags.contains(.isBurnable)
    }

    var isClimbable: Bool {
        flags.contains(.isClimbable)
    }

    var isContainer: Bool {
        flags.contains(.isContainer)
    }

    var isDestroyed: Bool {
        flags.contains(.isDestroyed)
    }

    var isDevice: Bool {
        flags.contains(.isDevice)
    }

    var isDoor: Bool {
        flags.contains(.isDoor)
    }

    var isDrinkable: Bool {
        flags.contains(.isDrinkable)
    }

    var isDryLand: Bool {
        flags.contains(.isDryLand)
    }

    var isEdible: Bool {
        flags.contains(.isEdible)
    }

    var isFemale: Bool {
        flags.contains(.isFemale)
    }

    var isFightable: Bool {
        flags.contains(.isFightable)
    }

    var isFlammable: Bool {
        flags.contains(.isFlammable)
    }

    var isFood: Bool {
        flags.contains(.isFood)
    }

    var isInNotOn: Bool {
        flags.contains(.isInNotOn)
    }

    var isIntegral: Bool {
        flags.contains(.isIntegral)
    }

    var isInvisible: Bool {
        flags.contains(.isInvisible)
    }

    var isLight: Bool {
        flags.contains(.isLight)
    }

    var isLocked: Bool {
        flags.contains(.isLocked)
    }

    var isMaze: Bool {
        flags.contains(.isMaze)
    }

    var isMidAirLocation: Bool {
        flags.contains(.isMidAirLocation)
    }

    var isNotLand: Bool {
        flags.contains(.isNotLand)
    }

    var isOn: Bool {
        flags.contains(.isOn)
    }

    var isOpen: Bool {
        flags.contains(.isOpen)
    }

    var isOpenable: Bool {
        flags.contains(.isOpenable)
    }

    var isOutside: Bool {
        flags.contains(.isOutside)
    }

    var isPerson: Bool {
        flags.contains(.isPerson)
    }

    var isPlural: Bool {
        flags.contains(.isPlural)
    }

    var isReadable: Bool {
        flags.contains(.isReadable)
    }

    var isSacred: Bool {
        flags.contains(.isSacred)
    }

    var isSearchable: Bool {
        flags.contains(.isSearchable)
    }

    var isStaggered: Bool {
        flags.contains(.isStaggered)
    }

    var isSurface: Bool {
        flags.contains(.isSurface)
    }

    var isTakable: Bool {
        flags.contains(.isTakable)
    }

    var isTool: Bool {
        flags.contains(.isTool)
    }

    var isTransparent: Bool {
        flags.contains(.isTransparent)
    }

    var isTurnable: Bool {
        flags.contains(.isTurnable)
    }

    var isVehicle: Bool {
        flags.contains(.isVehicle)
    }

    var isWaterLocation: Bool {
        flags.contains(.isWaterLocation)
    }

    var isWeapon: Bool {
        flags.contains(.isWeapon)
    }

    var isWearable: Bool {
        flags.contains(.isWearable)
    }

    var noImplicitTake: Bool {
        flags.contains(.noImplicitTake)
    }

    var omitArticle: Bool {
        flags.contains(.omitArticle)
    }

    var omitDescription: Bool {
        flags.contains(.omitDescription)
    }

    var omitFromTakeAll: Bool {
        flags.contains(.omitFromTakeAll)
    }

    var shouldKludge: Bool {
        flags.contains(.shouldKludge)
    }
}

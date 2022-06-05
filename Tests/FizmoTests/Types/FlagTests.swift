//
//  FlagTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import XCTest
import Fizmo

final class FlagTests: XCTestCase {
    func testPredefinedFlags() throws {
        XCTAssertEqual(
            Flag.find(id: "actorBit", zil: "ACTORBIT"),
            Flag.isActor
        )
        XCTAssertEqual(
            Flag.find(id: "attackBit", zil: "ATTACKBIT"),
            Flag.isAttackable
        )
        XCTAssertEqual(
            Flag.find(id: "burnBit", zil: "BURNBIT"),
            Flag.isBurnable
        )
        XCTAssertEqual(
            Flag.find(id: "climbBit", zil: "CLIMBBIT"),
            Flag.isClimbable
        )
        XCTAssertEqual(
            Flag.find(id: "contBit", zil: "CONTBIT"),
            Flag.isContainer
        )
        XCTAssertEqual(
            Flag.find(id: "deviceBit", zil: "DEVICEBIT"),
            Flag.isDevice
        )
        XCTAssertEqual(
            Flag.find(id: "doorBit", zil: "DOORBIT"),
            Flag.isDoor
        )
        XCTAssertEqual(
            Flag.find(id: "drinkBit", zil: "DRINKBIT"),
            Flag.isDrinkable
        )
        XCTAssertEqual(
            Flag.find(id: "dropBit", zil: "DROPBIT"),
            Flag.catchesDroppedItems
        )
        XCTAssertEqual(
            Flag.find(id: "edibleBit", zil: "EDIBLEBIT"),
            Flag.isEdible
        )
        XCTAssertEqual(
            Flag.find(id: "femaleBit", zil: "FEMALEBIT"),
            Flag.isFemale
        )
        XCTAssertEqual(
            Flag.find(id: "fightBit", zil: "FIGHTBIT"),
            Flag.isFightable
        )
        XCTAssertEqual(
            Flag.find(id: "flameBit", zil: "FLAMEBIT"),
            Flag.isFlammable
        )
        XCTAssertEqual(
            Flag.find(id: "foodBit", zil: "FOODBIT"),
            Flag.isFood
        )
        XCTAssertEqual(
            Flag.find(id: "inBit", zil: "INBIT"),
            Flag.isInNotOn
        )
        XCTAssertEqual(
            Flag.find(id: "integralBit", zil: "INTEGRALBIT"),
            Flag.isIntegral
        )
        XCTAssertEqual(
            Flag.find(id: "invisible", zil: "INVISIBLE"),
            Flag.isInvisible
        )
        XCTAssertEqual(
            Flag.find(id: "kludgeBit", zil: "KLUDGEBIT"),
            Flag.shouldKludge
        )
        XCTAssertEqual(
            Flag.find(id: "lightBit", zil: "LIGHTBIT"),
            Flag.isLight
        )
        XCTAssertEqual(
            Flag.find(id: "lockedBit", zil: "LOCKEDBIT"),
            Flag.isLocked
        )
        XCTAssertEqual(
            Flag.find(id: "mazeBit", zil: "MAZEBIT"),
            Flag.isMaze
        )
        XCTAssertEqual(
            Flag.find(id: "nallBit", zil: "NALLBIT"),
            Flag.omitFromTakeAll
        )
        XCTAssertEqual(
            Flag.find(id: "narticleBit", zil: "NARTICLEBIT"),
            Flag.omitArticle
        )
        XCTAssertEqual(
            Flag.find(id: "ndescBit", zil: "NDESCBIT"),
            Flag.omitDescription
        )
        XCTAssertEqual(
            Flag.find(id: "nonlandBit", zil: "NONLANDBIT"),
            Flag.isNotLand
        )
        XCTAssertEqual(
            Flag.find(id: "onBit", zil: "ONBIT"),
            Flag.isOn
        )
        XCTAssertEqual(
            Flag.find(id: "openableBit", zil: "OPENABLEBIT"),
            Flag.isOpenable
        )
        XCTAssertEqual(
            Flag.find(id: "openBit", zil: "OPENBIT"),
            Flag.isOpen
        )
        XCTAssertEqual(
            Flag.find(id: "outsideBit", zil: "OUTSIDEBIT"),
            Flag.isOutside
        )
        XCTAssertEqual(
            Flag.find(id: "partBit", zil: "PARTBIT"),
            Flag.isBodyPart
        )
        XCTAssertEqual(
            Flag.find(id: "personBit", zil: "PERSONBIT"),
            Flag.isPerson
        )
        XCTAssertEqual(
            Flag.find(id: "pluralBit", zil: "PLURALBIT"),
            Flag.isPlural
        )
        XCTAssertEqual(
            Flag.find(id: "rairBit", zil: "RAIRBIT"),
            Flag.isMidAirLocation
        )
        XCTAssertEqual(
            Flag.find(id: "readBit", zil: "READBIT"),
            Flag.isReadable
        )
        XCTAssertEqual(
            Flag.find(id: "rlandBit", zil: "RLANDBIT"),
            Flag.isDryLand
        )
        XCTAssertEqual(
            Flag.find(id: "rmungBit", zil: "RMUNGBIT"),
            Flag.isDestroyed
        )
        XCTAssertEqual(
            Flag.find(id: "rwaterBit", zil: "RWATERBIT"),
            Flag.isWaterLocation
        )
        XCTAssertEqual(
            Flag.find(id: "sacredBit", zil: "SACREDBIT"),
            Flag.isSacred
        )
        XCTAssertEqual(
            Flag.find(id: "searchBit", zil: "SEARCHBIT"),
            Flag.isSearchable
        )
        XCTAssertEqual(
            Flag.find(id: "staggeRed", zil: "STAGGERED"),
            Flag.isStaggered
        )
        XCTAssertEqual(
            Flag.find(id: "surfaceBit", zil: "SURFACEBIT"),
            Flag.isSurface
        )
        XCTAssertEqual(
            Flag.find(id: "takeBit", zil: "TAKEBIT"),
            Flag.isTakable
        )
        XCTAssertEqual(
            Flag.find(id: "toolBit", zil: "TOOLBIT"),
            Flag.isTool
        )
        XCTAssertEqual(
            Flag.find(id: "touchBit", zil: "TOUCHBIT"),
            Flag.hasBeenTouched
        )
        XCTAssertEqual(
            Flag.find(id: "transBit", zil: "TRANSBIT"),
            Flag.isTransparent
        )
        XCTAssertEqual(
            Flag.find(id: "trytakeBit", zil: "TRYTAKEBIT"),
            Flag.noImplicitTake
        )
        XCTAssertEqual(
            Flag.find(id: "turnBit", zil: "TURNBIT"),
            Flag.isTurnable
        )
        XCTAssertEqual(
            Flag.find(id: "vehBit", zil: "VEHBIT"),
            Flag.isVehicle
        )
        XCTAssertEqual(
            Flag.find(id: "vowelBit", zil: "VOWELBIT"),
            Flag.beginsWithVowel
        )
        XCTAssertEqual(
            Flag.find(id: "weaponBit", zil: "WEAPONBIT"),
            Flag.isWeapon
        )
        XCTAssertEqual(
            Flag.find(id: "wearBit", zil: "WEARBIT"),
            Flag.isWearable
        )
        XCTAssertEqual(
            Flag.find(id: "wornBit", zil: "WORNBIT"),
            Flag.isBeingWorn
        )
    }

    func testCustomFlags() {
        let spongeFlag = Flag.find(id: "spongeBit", zil: "SPONGEBIT")
        XCTAssertEqual(spongeFlag.id, "spongeBit")
    }
}

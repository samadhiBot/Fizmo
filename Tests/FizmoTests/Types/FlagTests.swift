//
//  FlagTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 3/19/22.
//

import XCTest
import Fizmo

final class FlagTests: XCTestCase {
    func testDefaults() throws {
        XCTAssertEqual(Flag.findOrCreate("actorBit"), Flag.isActor)
        XCTAssertEqual(Flag.findOrCreate("attackBit"), Flag.isAttackable)
        XCTAssertEqual(Flag.findOrCreate("burnBit"), Flag.isBurnable)
        XCTAssertEqual(Flag.findOrCreate("climbBit"), Flag.isClimbable)
        XCTAssertEqual(Flag.findOrCreate("contBit"), Flag.isContainer)
        XCTAssertEqual(Flag.findOrCreate("deviceBit"), Flag.isDevice)
        XCTAssertEqual(Flag.findOrCreate("doorBit"), Flag.isDoor)
        XCTAssertEqual(Flag.findOrCreate("drinkBit"), Flag.isDrinkable)
        XCTAssertEqual(Flag.findOrCreate("dropBit"), Flag.catchesDroppedItems)
        XCTAssertEqual(Flag.findOrCreate("edibleBit"), Flag.isEdible)
        XCTAssertEqual(Flag.findOrCreate("femaleBit"), Flag.isFemale)
        XCTAssertEqual(Flag.findOrCreate("fightBit"), Flag.isFightable)
        XCTAssertEqual(Flag.findOrCreate("flameBit"), Flag.isFlammable)
        XCTAssertEqual(Flag.findOrCreate("foodBit"), Flag.isFood)
        XCTAssertEqual(Flag.findOrCreate("inBit"), Flag.isInNotOn)
        XCTAssertEqual(Flag.findOrCreate("integralBit"), Flag.isIntegral)
        XCTAssertEqual(Flag.findOrCreate("invisible"), Flag.isInvisible)
        XCTAssertEqual(Flag.findOrCreate("kludgeBit"), Flag.shouldKludge)
        XCTAssertEqual(Flag.findOrCreate("lightBit"), Flag.isLight)
        XCTAssertEqual(Flag.findOrCreate("lockedBit"), Flag.isLocked)
        XCTAssertEqual(Flag.findOrCreate("mazeBit"), Flag.isMaze)
        XCTAssertEqual(Flag.findOrCreate("nallBit"), Flag.omitFromTakeAll)
        XCTAssertEqual(Flag.findOrCreate("narticleBit"), Flag.omitArticle)
        XCTAssertEqual(Flag.findOrCreate("ndescBit"), Flag.omitDescription)
        XCTAssertEqual(Flag.findOrCreate("nonlandBit"), Flag.isNotLand)
        XCTAssertEqual(Flag.findOrCreate("onBit"), Flag.isOn)
        XCTAssertEqual(Flag.findOrCreate("openableBit"), Flag.isOpenable)
        XCTAssertEqual(Flag.findOrCreate("openBit"), Flag.isOpen)
        XCTAssertEqual(Flag.findOrCreate("outsideBit"), Flag.isOutside)
        XCTAssertEqual(Flag.findOrCreate("partBit"), Flag.isBodyPart)
        XCTAssertEqual(Flag.findOrCreate("personBit"), Flag.isPerson)
        XCTAssertEqual(Flag.findOrCreate("pluralBit"), Flag.isPlural)
        XCTAssertEqual(Flag.findOrCreate("rairBit"), Flag.isMidAirLocation)
        XCTAssertEqual(Flag.findOrCreate("readBit"), Flag.isReadable)
        XCTAssertEqual(Flag.findOrCreate("rlandBit"), Flag.isDryLand)
        XCTAssertEqual(Flag.findOrCreate("rmungBit"), Flag.isDestroyed)
        XCTAssertEqual(Flag.findOrCreate("rwaterBit"), Flag.isWaterLocation)
        XCTAssertEqual(Flag.findOrCreate("sacredBit"), Flag.isSacred)
        XCTAssertEqual(Flag.findOrCreate("searchBit"), Flag.isSearchable)
        XCTAssertEqual(Flag.findOrCreate("staggered"), Flag.isStaggered)
        XCTAssertEqual(Flag.findOrCreate("surfaceBit"), Flag.isSurface)
        XCTAssertEqual(Flag.findOrCreate("takeBit"), Flag.isTakable)
        XCTAssertEqual(Flag.findOrCreate("toolBit"), Flag.isTool)
        XCTAssertEqual(Flag.findOrCreate("touchBit"), Flag.hasBeenTouched)
        XCTAssertEqual(Flag.findOrCreate("transBit"), Flag.isTransparent)
        XCTAssertEqual(Flag.findOrCreate("trytakeBit"), Flag.noImplicitTake)
        XCTAssertEqual(Flag.findOrCreate("turnBit"), Flag.isTurnable)
        XCTAssertEqual(Flag.findOrCreate("vehBit"), Flag.isVehicle)
        XCTAssertEqual(Flag.findOrCreate("vowelBit"), Flag.beginsWithVowel)
        XCTAssertEqual(Flag.findOrCreate("weaponBit"), Flag.isWeapon)
        XCTAssertEqual(Flag.findOrCreate("wearBit"), Flag.isWearable)
        XCTAssertEqual(Flag.findOrCreate("wornBit"), Flag.isBeingWorn)
    }

    func testCustomFlags() {
        let spongeFlag = Flag.findOrCreate("spongeBit")
        XCTAssertEqual(spongeFlag.id, Flag.ID(rawValue: "spongeBit"))
        XCTAssertEqual(Flag.findOrCreate("spongeBit"), spongeFlag)
    }
}

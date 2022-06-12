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
        XCTAssertEqual(Flag.find("actorBit"), Flag.isActor)
        XCTAssertEqual(Flag.find("attackBit"), Flag.isAttackable)
        XCTAssertEqual(Flag.find("burnBit"), Flag.isBurnable)
        XCTAssertEqual(Flag.find("climbBit"), Flag.isClimbable)
        XCTAssertEqual(Flag.find("contBit"), Flag.isContainer)
        XCTAssertEqual(Flag.find("deviceBit"), Flag.isDevice)
        XCTAssertEqual(Flag.find("doorBit"), Flag.isDoor)
        XCTAssertEqual(Flag.find("drinkBit"), Flag.isDrinkable)
        XCTAssertEqual(Flag.find("dropBit"), Flag.catchesDroppedItems)
        XCTAssertEqual(Flag.find("edibleBit"), Flag.isEdible)
        XCTAssertEqual(Flag.find("femaleBit"), Flag.isFemale)
        XCTAssertEqual(Flag.find("fightBit"), Flag.isFightable)
        XCTAssertEqual(Flag.find("flameBit"), Flag.isFlammable)
        XCTAssertEqual(Flag.find("foodBit"), Flag.isFood)
        XCTAssertEqual(Flag.find("inBit"), Flag.isInNotOn)
        XCTAssertEqual(Flag.find("integralBit"), Flag.isIntegral)
        XCTAssertEqual(Flag.find("invisible"), Flag.isInvisible)
        XCTAssertEqual(Flag.find("kludgeBit"), Flag.shouldKludge)
        XCTAssertEqual(Flag.find("lightBit"), Flag.isLight)
        XCTAssertEqual(Flag.find("lockedBit"), Flag.isLocked)
        XCTAssertEqual(Flag.find("mazeBit"), Flag.isMaze)
        XCTAssertEqual(Flag.find("nallBit"), Flag.omitFromTakeAll)
        XCTAssertEqual(Flag.find("narticleBit"), Flag.omitArticle)
        XCTAssertEqual(Flag.find("ndescBit"), Flag.omitDescription)
        XCTAssertEqual(Flag.find("nonlandBit"), Flag.isNotLand)
        XCTAssertEqual(Flag.find("onBit"), Flag.isOn)
        XCTAssertEqual(Flag.find("openableBit"), Flag.isOpenable)
        XCTAssertEqual(Flag.find("openBit"), Flag.isOpen)
        XCTAssertEqual(Flag.find("outsideBit"), Flag.isOutside)
        XCTAssertEqual(Flag.find("partBit"), Flag.isBodyPart)
        XCTAssertEqual(Flag.find("personBit"), Flag.isPerson)
        XCTAssertEqual(Flag.find("pluralBit"), Flag.isPlural)
        XCTAssertEqual(Flag.find("rairBit"), Flag.isMidAirLocation)
        XCTAssertEqual(Flag.find("readBit"), Flag.isReadable)
        XCTAssertEqual(Flag.find("rlandBit"), Flag.isDryLand)
        XCTAssertEqual(Flag.find("rmungBit"), Flag.isDestroyed)
        XCTAssertEqual(Flag.find("rwaterBit"), Flag.isWaterLocation)
        XCTAssertEqual(Flag.find("sacredBit"), Flag.isSacred)
        XCTAssertEqual(Flag.find("searchBit"), Flag.isSearchable)
        XCTAssertEqual(Flag.find("staggered"), Flag.isStaggered)
        XCTAssertEqual(Flag.find("surfaceBit"), Flag.isSurface)
        XCTAssertEqual(Flag.find("takeBit"), Flag.isTakable)
        XCTAssertEqual(Flag.find("toolBit"), Flag.isTool)
        XCTAssertEqual(Flag.find("touchBit"), Flag.hasBeenTouched)
        XCTAssertEqual(Flag.find("transBit"), Flag.isTransparent)
        XCTAssertEqual(Flag.find("trytakeBit"), Flag.noImplicitTake)
        XCTAssertEqual(Flag.find("turnBit"), Flag.isTurnable)
        XCTAssertEqual(Flag.find("vehBit"), Flag.isVehicle)
        XCTAssertEqual(Flag.find("vowelBit"), Flag.beginsWithVowel)
        XCTAssertEqual(Flag.find("weaponBit"), Flag.isWeapon)
        XCTAssertEqual(Flag.find("wearBit"), Flag.isWearable)
        XCTAssertEqual(Flag.find("wornBit"), Flag.isBeingWorn)
    }

    func testCustomFlags() {
        let spongeFlag = Flag.find("spongeBit")
        XCTAssertEqual(spongeFlag.id, "spongeBit")
    }
}

//
//  SyntaxTests.swift
//  Fizmo
//
//  Created by Chris Sessions on 5/5/22.
//

import CustomDump
import XCTest
import Fizmo

final class SyntaxTests: FizmoTests {
    func testQuitSyntax() {
        _ = Syntax(
            verb: "quit",
            action: "vQuit"
        )
    }

    func testContemplateSyntax() {
        _ = Syntax(
            verb: "contemplate",
            directObject: Syntax.Object(),
            action: "vThinkAbout"
        )
    }

    func testTakeSyntax() {
        _ = Syntax(
            verb: "take",
            directObject: Syntax.Object(
                where: .isTakable,
                search: [.many, .onGround, .inRoom]
            ),
            action: "vTake"
        )
    }

    func test() {
        _ = Syntax(
            verb: "put",
            directObject: Syntax.Object(
                search: [.carried, .held, .many, .take]
            ),
            indirectObject: Syntax.Object(
                preposition: "in",
                where: .isContainer,
                search: [.inRoom, .many, .onGround]
            ),
            action: "vPutIn",
            preAction: "prePutIn"
        )
    }
}

//
//  Actions.swift
//  MicroCosm
//
//  Created by Chris Sessions on 2/25/23.
//

import Fizmo

extension MicroCosm {
    var actions: [Routine.ID: Routine.Function] {
        [
            "incrementScore": .voidBool(incrementScore),
            "mailboxFunc": .voidVoid(mailboxFunc),
            "westHouse": .intVoid(westHouse),
        ]
    }
}

// MARK: - Action functions

extension MicroCosm {
    /// Increments the score by 1 and returns true if the score is greater than zero, else false.
    func incrementScore() -> Bool {
        globals.score += 1

        return globals.score > 0
    }

    /// The `mailboxFunc` (MAILBOX-F) routine.
    func mailboxFunc() {
//        if .and(
//            isParsedVerb(.take),
//            parsedDirectObject.equals(mailbox)
//        ) {
//            output("It is securely anchored.")
//        }
    }

    /// The `westHouse` (WEST-HOUSE) routine.
    func westHouse(rarg _: Int) {
//        if rarg.equals(mLook) {
//            output("""
//                 You are standing in an open field west of a white house, \
//                 with a boarded front door.
//                 """)
//            if wonFlag {
//                output(" A secret path leads southwest into the forest.")
//            }
//            output("\n")
//        }
    }
}

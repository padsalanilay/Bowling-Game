//
//  GameDelegate.swift
//  bowling
//
//

import Foundation

protocol GameDelegate: AnyObject {

    func gameFinished()

    func availableShotsDidChange(toShots: [Shot])

    func framesDidChange(toPlayer: [Player])
}

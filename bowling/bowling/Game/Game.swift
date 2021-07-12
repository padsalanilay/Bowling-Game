//
//  Game.swift
//  bowling
//
//

import Foundation

class Game {    
    var players: [Player]
    
    weak var delegate: GameDelegate?
    
    init() {
        self.players = [Player(name: "Player 1")]
    }
    
    func take(shot: Shot) throws {
                
        guard self.players[0].currentFrameNumber < 10 else {
            throw GameError.GameHasFinished
        }
        
        let shots = self.players[0].take(shot: shot)
        
        delegate?.framesDidChange(toPlayer: players)
        delegate?.availableShotsDidChange(toShots: shots)
        
        if isGameFinished() {
            delegate?.gameFinished()
        }
    }

    private func isGameFinished() -> Bool {
        self.players[0].currentFrameNumber == 10
    }
}

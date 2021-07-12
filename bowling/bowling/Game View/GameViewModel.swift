//
//  GameViewModel.swift
//  bowling
//
//

import Foundation

extension GameViewController: GameDelegate {
    func startNewGame() {
        self.game = Game()
        self.reloadViewForNewGame()
    }
    
    //MARK: GameDelegate
    func gameFinished() {
        self.showGameFinishAlert()
    }
    
    func availableShotsDidChange(toShots: [Shot]) {
        self.shots = toShots
    }
    
    func framesDidChange(toPlayer: [Player]) {
        self.players = toPlayer
    }
    
    func take(shot: Shot) {
        try? game.take(shot: shot)        
    }
    
}

//
//  Player.swift
//  bowling
//
//

import Foundation

struct Player {
    var name: String
    var frames: [Frame]
    
    var currentFrameNumber: Int = 0
    
    init(name: String, frames: [Frame] = []) {
        self.name = name
        
        // create empty frames to populate screen
        self.frames = [Frame](repeating: Frame(), count: 10)
        self.frames[9].isFinal = true
    }
    
}

extension Player {
    mutating func take(shot: Shot) -> [Shot] {
        
        let current = self.currentFrameNumber
        let next = current + 1
        
        
        if let newFrame = try? self.frames[current].take(shot: shot) {
            
            if newFrame.bonusRolls > 0 {
                updateScoreForFrame(at: current, with: shot)
            }
            
            if next < 10 {
                if case .strike = shot {
                    self.frames[next].bonusRolls = 2
                }

                if case .spare = shot {
                    self.frames[next].bonusRolls = 1
                }
            }
                        
            if newFrame.hasAllShotsTaken() {
                self.currentFrameNumber += 1
                if next < 10 {
                    self.frames[next].score = self.frames[current].score
                }
            }
        }
        
        return currentFrameNumber < 10 ? self.frames[self.currentFrameNumber].allValidShots() : []
    }
    
    private mutating func updateScoreForFrame(at index: Int, with shot: Shot) {
        let previousFrameIndex = index - 1
        
        // if the previous frame has bonus rolls then update score for frame before that
        if self.frames[previousFrameIndex].bonusRolls > 0 {
            updateScoreForFrame(at: previousFrameIndex, with: shot)
        }
        
        // update score for previous frame
        self.frames[previousFrameIndex].updateScore(for: shot)
        
        // set current frame score to previous frame score
        self.frames[index].score = self.frames[previousFrameIndex].score
        
        // add all the shots score of current frame into score
        for shot in self.frames[index].shots {
            self.frames[index].score += shot.numericValue
        }
        
        // update required bonus rolls
        self.frames[index].bonusRolls -= 1
    }
}

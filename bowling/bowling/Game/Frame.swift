//
//  Frame.swift
//  bowling
//
//

import Foundation

typealias Score = Int

struct Frame {
    var score: Score = 0
    var bonusRolls: Int = 0

    var shots: [Shot]
    var isFinal: Bool
    
    init(shots: [Shot] = [], isFinal: Bool = false) {
        self.shots = shots
        self.isFinal = isFinal
    }
}

extension Frame {

    func allValidShots() -> [Shot] {
        let allShots = Shot.allShots
        
        // first shot
        if self.shots.count == 0 {
            return allShots
        }
        // second shot
        else if self.shots.count == 1 {
            if isFinal && shots.first == .strike {
                return allShots
            }
            
            return possibleFollowingShots(for: shots[0])
            
        }
        // third shot
        else {
            if isFinal {
                if case .strike = shots[0] {
                    if case .strike = shots[1] {
                        return allShots
                    }
                    
                    return possibleFollowingShots(for: shots[1])
                }
                
                if shots[1] == .spare(pinsKnockedDown: PinsKnockedDown(rawValue: 10 - shots[0].numericValue)!)
                {
                    return allShots
                }
            }

            return []
        }
    }
    
    private func possibleFollowingShots(for shot: Shot) -> [Shot] {
        let remainingPins = 10 - shot.numericValue
        let possibleShots = Shot.allShots.filter { shot in
            shot.numericValue < remainingPins
        }
        
        let possibleSpare = Shot.spare(pinsKnockedDown: PinsKnockedDown(rawValue: remainingPins)!)
        
        return possibleShots + [possibleSpare]
    }
    
    mutating func take(shot: Shot) throws -> Frame{
        if hasAllShotsTaken() {
            throw ShotError.ShotsNotAvailable
        }
        
        self.shots.append(shot)
        self.updateScore(for: shot)
        return self
    }
    
    func hasAllShotsTaken() -> Bool {
        if isFinal {
            return allNecessaryShotsTakenInFinalFrame()
        }

        return allNecessaryShotsTakenInNonFinalFrame()
    }
    
    private func allNecessaryShotsTakenInNonFinalFrame() -> Bool {

        if shots.isEmpty {
            return false
        }

        if case .strike = shots[0] {
            return true
        }

        if shots.count >= 2 {
            return true
        }

        return false
    }

    private func allNecessaryShotsTakenInFinalFrame() -> Bool {

        if shots.count >= 3 {
            return true
        }

        if shots.count < 2 {
            return false
        }

        if case .strike = shots[0] {
            return false
        }

        if shots.count >= 2 {
            if case .spare = shots[1] {
                return false
            }
        }

        return true
    }
    
    mutating func updateScore(for shot: Shot) {
        self.score += shot.numericValue
    }
}

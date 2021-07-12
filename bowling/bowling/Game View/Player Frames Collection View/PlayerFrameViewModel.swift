//
//  PlayerFrameViewModel.swift
//  bowling
//
//

import Foundation

struct FrameViewModel {
    var firstShotScore: String?
    var secondShotScore: String?
    var thirdShotScore: String?
    
    var currentTotalScore: String?
}

extension FrameViewModel {
    init(frame: Frame) {
        currentTotalScore = frame.shots.isEmpty ? nil : "\(frame.score)"
        
        let shots = frame.shots

        switch shots.count {
        case 1:
            firstShotScore = nil
            secondShotScore = shots[0].stringValue
            thirdShotScore = nil
        case 2:
            firstShotScore = nil
            secondShotScore = shots[0].stringValue
            thirdShotScore = shots[1].stringValue
        case 3:
            firstShotScore = shots[0].stringValue
            secondShotScore = shots[1].stringValue
            thirdShotScore = shots[2].stringValue
        default:
            firstShotScore = nil
            secondShotScore = nil
            thirdShotScore = nil
        }
    }
}

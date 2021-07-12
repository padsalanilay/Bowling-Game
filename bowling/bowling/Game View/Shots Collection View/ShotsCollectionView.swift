//
//  ShotsCollectionView.swift
//  Bowling
//
//

import Foundation
import UIKit

extension GameViewController {
    
    func configureShotsCollectionView() {
        self.shotsCollectionView.dataSource = self
        self.shotsCollectionView.delegate = self
        let nib = UINib(nibName: "ShotsCollectionViewCell", bundle: nil)
        self.shotsCollectionView.register(nib, forCellWithReuseIdentifier: ShotsCollectionViewCell.reuseIdentifier)
        
        self.loadAvailableShots()
    }
    
    func loadAvailableShots() {
        if let player = self.players.first {
            let frameNum = player.currentFrameNumber
            let currentFrame = player.frames[frameNum]
            self.availableShotsDidChange(toShots: currentFrame.allValidShots())
        }
    }
    
   
}

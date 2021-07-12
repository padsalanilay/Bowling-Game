//
//  PlayerFramesCollectionView.swift
//  bowling
//
//

import Foundation
import UIKit

extension GameViewController {
    
    func configurePlayerFramesCollectionView() {
        self.playerFramesCollectionView.dataSource = self
        self.playerFramesCollectionView.delegate = self
        let nib = UINib(nibName: "PlayerFrameCollectionViewCell", bundle: nil)
        self.playerFramesCollectionView.register(nib, forCellWithReuseIdentifier: PlayerFrameCollectionViewCell.reuseIdentifier)

        framesDidChange(toPlayer: self.game.players)
    }
    
    
}

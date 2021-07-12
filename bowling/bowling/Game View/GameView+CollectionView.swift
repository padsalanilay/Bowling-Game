//
//  GameView+CollectionView.swift
//  bowling
//
//

import Foundation
import UIKit

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView == playerFramesCollectionView {
            return self.players.count
        }
        
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == playerFramesCollectionView {
            return self.players[section].frames.count
        }
        
        return shots.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == playerFramesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerFrameCollectionViewCell.reuseIdentifier, for: indexPath) as! PlayerFrameCollectionViewCell
        
            cell.configure(with: players[indexPath.section].frames[indexPath.row])
            cell.backgroundColor = .red
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShotsCollectionViewCell.reuseIdentifier, for: indexPath) as! ShotsCollectionViewCell
    
        cell.configure(with: shots[indexPath.item])
    
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == shotsCollectionView {
            let shot = shots[indexPath.item]
            self.take(shot: shot)
        }
    }
    
}

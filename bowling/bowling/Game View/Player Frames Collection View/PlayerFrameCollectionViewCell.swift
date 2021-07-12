//
//  PlayerFrameCollectionViewCell.swift
//  bowling
//
//

import UIKit

class PlayerFrameCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "playerFramesCollectionViewCell"
    
    @IBOutlet weak var firstShotScoreLabel: UILabel!
    @IBOutlet weak var secondShotScoreLabel: UILabel!
    @IBOutlet weak var thirdShotScoreLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!

    func configure(with frame: Frame) {
        let frameViewModel = FrameViewModel(frame: frame)
        firstShotScoreLabel.text = frameViewModel.firstShotScore
        secondShotScoreLabel.text = frameViewModel.secondShotScore
        thirdShotScoreLabel.text = frameViewModel.thirdShotScore
        
        totalScoreLabel.text = frameViewModel.currentTotalScore
    }
}

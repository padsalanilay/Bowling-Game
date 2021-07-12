//
//  ShotsCollectionViewCell.swift
//  Bowling
//
//

import UIKit

class ShotsCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "shotsCollectionViewCell"
    @IBOutlet weak var shotValue: UILabel!

    func configure(with shot: Shot) {
        
        self.shotValue.text = shot.stringValue
    }
}

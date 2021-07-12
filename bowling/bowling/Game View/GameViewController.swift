//
//  ViewController.swift
//  bowling
//
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var shotsCollectionView: UICollectionView!
    @IBOutlet weak var playerFramesCollectionView: UICollectionView!

    var shots: [Shot] = [] {
        didSet {
            self.shotsCollectionView.reloadData()
        }
    }
    
    var players: [Player] = [] {
        didSet {
            self.playerFramesCollectionView.reloadData()
        }
    }
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadViewForNewGame()
    }

    func showGameFinishAlert() {
        let alert = UIAlertController(title: "Your Game has been finished", message: "your total score is \(self.game.players[0].frames[9].score)", preferredStyle: .alert)
        
        let OKAlertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.startNewGame()
        }
        
        alert.addAction(OKAlertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func reloadViewForNewGame() {
        self.configurePlayerFramesCollectionView()
        self.configureShotsCollectionView()
        self.game.delegate = self
    }
}


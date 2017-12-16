//
//  ViewController.swift
//  Monopoly
//
//  Created by Tillson Galloway on 8/24/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create variables here
    var playerCount = 2
    
    // Arrays created for you
    var players = [Player]()
    var board = [Property]()
    
    var currentPlayerTurnIndex = 0
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    var spaces = 0
    
    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var boardImageView: UIImageView!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Property loading code
        board = Utilities.getPropertiesFromFile()
        boardImageView.contentMode = .scaleAspectFit
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            Utilities.setupBoard(vc: self)
        }
        // End property loading code
        
        for i in 0..<playerCount {
            players.append(Player(name: "Player \(i + 1)", location: 0))
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let height = self.playerView.frame.size.height / CGFloat(self.players.count)
            self.playerView.backgroundColor = .red
            self.playerView.clipsToBounds = true
            for (index, player) in self.players.enumerated() {
                let theView = UIView(frame: CGRect(x: 0, y: (CGFloat(index) * height), width: self.playerView.frame.width, height: height))
                theView.layer.borderWidth = 1.0
                theView.layer.borderColor = UIColor.white.cgColor
                theView.backgroundColor = Utilities.playerColors[index]
                
                let label = UILabel(frame: CGRect(x: 20, y: 0, width: self.playerView.frame.width, height: height / 4))
                label.font = UIFont.systemFont(ofSize: height / 4.5)
                label.text = player.name
                label.adjustsFontSizeToFitWidth = true
                label.textColor = .white
                theView.addSubview(label)
                let moneyLabel = UILabel(frame: CGRect(x: 20, y: height / 4, width: self.playerView.frame.width, height: height / 4))
                moneyLabel.font = UIFont.systemFont(ofSize: height / 4)
                moneyLabel.text = "$\(player.money)"
                moneyLabel.adjustsFontSizeToFitWidth = true
                moneyLabel.textColor = .white
                theView.addSubview(moneyLabel)
                
                self.playerView.addSubview(theView)
                player.moneyLabel = moneyLabel
            }
        }
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        // for loop - Only call Play function if more than one player has money

    }
    
    func diceRoll() -> Int {
        randomDiceIndex1 = 0
        randomDiceIndex2 = 0
        
        // Graphics
        diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2)")
        // End Graphics
        
        return randomDiceIndex1 + randomDiceIndex2
    }

    func playGame() {
        
        // is player in jail?
        
        // if not, roll dice
        
        // move player to new location
        
        // what kind of property did they land on? can they buy it? Do they get money? Do they pay rent? Did they pass go?
        
        // Did they roll doubles?
        
        // next players turn
    }

    // This function updates the player's graphical location (on the screen) to whatever is set for player.location
    func movePieceFor(player: Player) {
        player.playerMarker.frame.origin = Utilities.pointThatCenters(view: player.playerMarker, on: self.board[player.location].centerCoordinate!)
    }
    
}


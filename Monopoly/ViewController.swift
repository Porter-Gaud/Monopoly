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
        let randomDiceNumber1 = 1
        let randomDiceNumber2 = 1
        
        // Graphics
        // Images called dice1 dice2...dice6 exist in Assets.xcassets and correspond with the number of pips on the dice.
        diceImageView1.image = UIImage(named: "dice\(randomDiceNumber1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceNumber2)")
        // End Graphics
        
        return randomDiceNumber1 + randomDiceNumber2
    }

    func playGame() {
        
        movePiece(player: players[0])
        
        // Is player in jail?
        
        // If not, roll dice
        
        // Move player to new location
        
        // Update the player's location graphically – function is movePiece(player: player)
        
        // What kind of property did they land on? can they buy it? Do they get money? Do they pay rent? Did they pass go?
        
        // Did they roll doubles?
        
        // next players turn
    }

    
    /**
     Updates the player's graphical location (on the screen) to whatever is set for player.location.
     
     - Parameter player: The player who you would like to update the graphical location for.
     */
    func movePiece(player: Player) {
        player.playerMarker.frame.origin = Utilities.pointThatCenters(view: player.playerMarker, on: self.board[player.location].centerCoordinate!)
    }
    
}


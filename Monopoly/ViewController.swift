//
//  ViewController.swift
//  Monopoly
//
//  Created by Tillson Galloway on 8/24/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerCount = 2
    
    var players = [Player]()
    var board = [Property]()
    
    var currentPlayerTurnIndex = 0
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var boardImageView: UIImageView!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Property loading code
        board = Utilities.getPropertiesFromFile()
        boardImageView.contentMode = .scaleAspectFit
        let propertyWidth = boardImageView.frame.width / 11.0
        let propertyHeight = boardImageView.frame.height / 11.0
        for i in 1..<10 {
            let property = board[i]
            let spaceView = UIView(frame: CGRect(x: boardImageView.frame.width - (propertyWidth * CGFloat(i)), y: propertyHeight, width: propertyWidth, height: propertyHeight))
//            spaceView.backgroundColor = UIColor.red
            boardImageView.addSubview(spaceView)
            property.view = spaceView
        }

        // End property loading code
        
        for i in 0..<playerCount {
            players.append(Player(name: "Player \(i + 1)", location: 0))
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        let height = playerView.frame.size.height / CGFloat(players.count)
        playerView.backgroundColor = .red
        playerView.clipsToBounds = true
        for (index, player) in players.enumerated() {
            let theView = UIView(frame: CGRect(x: 0, y: (CGFloat(index) * height), width: playerView.frame.width, height: height))
            theView.layer.borderWidth = 1.0
            theView.layer.borderColor = UIColor.white.cgColor
            theView.backgroundColor = UIColor.black // MAKE THIS A RANDOM NICE LOOKING COLOR
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: playerView.frame.width, height: height / 4))
            label.font = UIFont.systemFont(ofSize: 32.0)
            label.text = player.name
            label.textColor = .white
            theView.addSubview(label)
            let moneyLabel = UILabel(frame: CGRect(x: 0, y: height / 4, width: playerView.frame.width, height: height / 4))
            moneyLabel.font = UIFont.systemFont(ofSize: 42.0)
            moneyLabel.text = "$\(player.money)"
            moneyLabel.textColor = .white
            theView.addSubview(moneyLabel)
            
            playerView.addSubview(theView)
            player.playerView = theView
        }
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // Code to run a turn
        let spaces = diceRoll()
        print(spaces)
        
        let newProperty = movePlayerToLocation(location: players[currentPlayerTurnIndex].location + spaces) // Should we keep this in the starter code?
        print(newProperty)
        
    }
    
    func diceRoll() -> Int {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        // Graphics
        diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2)")
        // End Graphics
        
        return randomDiceIndex1 + randomDiceIndex2 + 2
    }
    
    /* Returns the property that the player is going to land on */
    func movePlayerToLocation(location: Int) -> Property {
        
        
        return board[location]
    }
    
    
}


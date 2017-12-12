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
        boardImageView.backgroundColor = .green
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.boardImageView.frame.size = self.boardImageView.image!.size
            self.boardImageView.frame.size.height = 670
            let propertyWidth = self.boardImageView.frame.width / (37/3) // 37/3 ratio found using system of equations [total = 2corner + 9space, corner = (5/3)space]
            let cornerWidth = propertyWidth * (5/3)
            let propertyHeight = cornerWidth
            
            // Bottom Row
            self.board[0].centerCoordinate = Utilities.getCenter(rect: CGRect(x: self.boardImageView.frame.width - cornerWidth, y: self.boardImageView.frame.height - propertyHeight, width: cornerWidth, height: propertyHeight))
            for i in 1..<10 {
                let property = self.board[i]
                let rect = CGRect(x: self.boardImageView.frame.width - cornerWidth - (propertyWidth * CGFloat(i)), y: self.boardImageView.frame.height - propertyHeight, width: propertyWidth, height: propertyHeight)
                property.centerCoordinate = Utilities.getCenter(rect: rect)
            }
            // Left Row
            self.board[10].centerCoordinate = Utilities.getCenter(rect: CGRect(x: 0, y: self.boardImageView.frame.height - propertyHeight, width: cornerWidth, height: propertyHeight))
            for i in 1..<10 {
                let property = self.board[i + 10]
                let rect = CGRect(x: 0, y: self.boardImageView.frame.height - cornerWidth - (propertyWidth * CGFloat(i)), width: propertyHeight, height: propertyWidth)
                property.centerCoordinate = Utilities.getCenter(rect: rect)
            }
            // Top Row
            self.board[20].centerCoordinate = Utilities.getCenter(rect: CGRect(x: 0, y: self.boardImageView.frame.height - propertyHeight, width: cornerWidth, height: propertyHeight))
            for i in 1..<10 {
                let property = self.board[i + 20]
                let rect = CGRect(x: cornerWidth + (propertyWidth * CGFloat(i - 1)), y: 0, width: propertyWidth, height: propertyHeight)
                property.centerCoordinate = Utilities.getCenter(rect: rect)
            }
            // Alvin Row
            self.board[30].centerCoordinate = Utilities.getCenter(rect: CGRect(x: 0, y: 0, width: cornerWidth, height: propertyHeight))
            for i in 1..<10 {
                let property = self.board[i + 30]
                let rect = CGRect(x: 0, y: self.boardImageView.frame.height + cornerWidth + (propertyWidth * CGFloat(i - 1)), width: propertyHeight, height: propertyWidth)
                property.centerCoordinate = Utilities.getCenter(rect: rect)
            }
            
            for player in self.players {
                let playerMarker = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                playerMarker.frame.origin = Utilities.pointThatCenters(view: playerMarker, on: self.board[0].centerCoordinate!)
                playerMarker.font = UIFont.systemFont(ofSize: 20.0)
                playerMarker.text = player.name
                playerMarker.textColor = .white
                playerMarker.adjustsFontSizeToFitWidth = true
                playerMarker.backgroundColor = .red
                playerMarker.layer.cornerRadius = playerMarker.frame.width / 2.0
                self.boardImageView.addSubview(playerMarker)
                player.playerMarker = playerMarker
            }
            
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
        // Code to run a turn
        let spaces = diceRoll()
        print(spaces)
        
        let newProperty = movePlayerToLocation(location: players[currentPlayerTurnIndex].location + spaces) // Should we keep this in the starter code?
                
        print(newProperty)
        
    }
    
    func diceRoll() -> Int {
        randomDiceIndex1 = 1
        randomDiceIndex2 = 1
        
        // Graphics
        diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2)")
        // End Graphics
        
        return randomDiceIndex1 + randomDiceIndex2
    }
    
    /* Returns the property that the player is going to land on */
    func movePlayerToLocation(location: Int) -> Property {
        
        
        return board[location]
    }
    
    func movePieceFor(player: Player, toLocationAtIndex: Int) {
        player.playerMarker.frame.origin = Utilities.pointThatCenters(view: player.playerMarker, on: self.board[toLocationAtIndex].centerCoordinate!)
    }
    
}


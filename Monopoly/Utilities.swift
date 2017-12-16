//
//  Utilities.swift
//  Monopoly
//
//  Created by Tillson Galloway on 10/4/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit

class Utilities {
    
    // MARK: Monopoly Utilities
    
    /**
     Colors that correspond with players for graphical scoreboard/board pieces.
     */
    static let playerColors = [
        UIColor(red:0.94, green:0.36, blue:0.37, alpha:1.0),
        UIColor(red:0.18, green:0.19, blue:0.26, alpha:1.0),
        UIColor(red:0.31, green:0.36, blue:0.46, alpha:1.0),
        UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0),
        UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0),
        UIColor(red:0.34, green:0.64, blue:0.65, alpha:1.0)
    ]
    
    /**
     Deserializes properties.txt into an array of Property objects.
     
     - Returns: Array of properties based on the contents of properties.txt.
     */
    class func getPropertiesFromFile() -> [Property] {
        var properties = [Property]()

        if let path = Bundle.main.path(forResource: "properties", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let array = data.components(separatedBy: .newlines)
                for (index, line) in array.enumerated() {
                    if line == "" {
                        continue
                    }
                    let propertyData = line.components(separatedBy: ",")
                    let name = propertyData[0]
                    let price = Int(propertyData[1])!
                    let color = Color(rawValue: propertyData[2])!
                    let rent = Int(propertyData[3])!
                    properties.append(Property(name: name, location: index, color: color, price: price, rent: rent))
                }
            } catch {
                print("ERROR WHILE LOADING PROPERTIES: \(error)")
            }
        }
        
        return properties
    }
    
    
    /**
     Sets up a Monopoly board in the ViewController class.
     
     - Parameter vc: Instance of ViewController.  Usually this is just "self"
     
     - Note: This is in Utilities to keep the ViewController 'clean'. This function must be called from the ViewController class or the app will crash.
     */
    class func setupBoard(vc: ViewController) {
        vc.boardImageView.clipsToBounds = true
        vc.boardImageView.frame.size = vc.boardImageView.image!.size
        let propertyWidth = vc.boardImageView.frame.width / (37/3) // 37/3 ratio found using system of equations [total = 2corner + 9space, corner = (5/3)space]
        let cornerWidth = propertyWidth * (5/3)
        let propertyHeight = cornerWidth
        
        // Bottom Row
        vc.board[0].centerCoordinate = Utilities.getCenter(rect: CGRect(x: vc.boardImageView.frame.width - cornerWidth, y: vc.boardImageView.frame.height - propertyHeight, width: cornerWidth, height: propertyHeight))
        for i in 1..<10 {
            let property = vc.board[i]
            let rect = CGRect(x: vc.boardImageView.frame.width - cornerWidth - (propertyWidth * CGFloat(i)), y: vc.boardImageView.frame.height - propertyHeight, width: propertyWidth, height: propertyHeight)
            property.centerCoordinate = Utilities.getCenter(rect: rect)
        }
        // Left Row
        vc.board[10].centerCoordinate = Utilities.getCenter(rect: CGRect(x: 0, y: vc.boardImageView.frame.height - propertyHeight, width: cornerWidth, height: propertyHeight))
        for i in 1..<10 {
            let property = vc.board[i + 10]
            let rect = CGRect(x: 0, y: vc.boardImageView.frame.height - cornerWidth - (propertyWidth * CGFloat(i)), width: propertyHeight, height: propertyWidth)
            property.centerCoordinate = Utilities.getCenter(rect: rect)
        }
        // Top Row
        vc.board[20].centerCoordinate = Utilities.getCenter(rect: CGRect(x: 0, y: vc.boardImageView.frame.height - propertyHeight, width: cornerWidth, height: propertyHeight))
        for i in 1..<10 {
            let property = vc.board[i + 20]
            let rect = CGRect(x: cornerWidth + (propertyWidth * CGFloat(i - 1)), y: 0, width: propertyWidth, height: propertyHeight)
            property.centerCoordinate = Utilities.getCenter(rect: rect)
        }
        // Alvin Row
        vc.board[30].centerCoordinate = Utilities.getCenter(rect: CGRect(x: 0, y: 0, width: cornerWidth, height: propertyHeight))
        for i in 1..<10 {
            let property = vc.board[i + 30]
            let rect = CGRect(x: 0, y: vc.boardImageView.frame.height + cornerWidth + (propertyWidth * CGFloat(i - 1)), width: propertyHeight, height: propertyWidth)
            property.centerCoordinate = Utilities.getCenter(rect: rect)
        }
        
        for (index, player) in vc.players.enumerated() {
            let playerMarker = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            playerMarker.frame.origin = Utilities.pointThatCenters(view: playerMarker, on: vc.board[0].centerCoordinate!)
            playerMarker.font = UIFont.systemFont(ofSize: 20.0)
            playerMarker.text = player.name
            playerMarker.textColor = .white
            playerMarker.adjustsFontSizeToFitWidth = true
            playerMarker.backgroundColor = Utilities.playerColors[index]
            playerMarker.layer.cornerRadius = playerMarker.frame.width / 2
            playerMarker.layer.masksToBounds = true
            vc.boardImageView.addSubview(playerMarker)
            player.playerMarker = playerMarker
        }
        

    }

    
    // MARK: General Utilities
    
    /**
     Get center point of a rectangle.
     
     - Parameter rect: The CGRect that you want the center of
     - Returns: CGPoint of the center
     */
    class func getCenter(rect: CGRect) -> CGPoint {
        return CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
    }
    
    /**
     Get an origin point (top left) that will center a UIView of any size around a point.
     
     - Parameter view: The CGRect that you want the center of
     - Parameter on: The point that you want to center the view around.
     - Returns: CGPoint of the origin that will center the view around a point.
     */
    class func pointThatCenters(view: UIView, on: CGPoint) -> CGPoint {
        return CGPoint(x: on.x - (view.frame.width / 2), y: on.y - (view.frame.height / 2))
    }
    
}

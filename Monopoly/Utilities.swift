//
//  Utilities.swift
//  Monopoly
//
//  Created by Tillson Galloway on 10/4/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit

class Utilities {
    
    static let playerColors = [
        UIColor(red:0.94, green:0.36, blue:0.37, alpha:1.0),
        UIColor(red:0.18, green:0.19, blue:0.26, alpha:1.0),
        UIColor(red:0.31, green:0.36, blue:0.46, alpha:1.0),
        UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0),
        UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0),
        UIColor(red:0.34, green:0.64, blue:0.65, alpha:1.0)
    ]
    
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
    
    class func getCenter(rect: CGRect) -> CGPoint {
        return CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
    }
    class func pointThatCenters(view: UIView, on: CGPoint) -> CGPoint {
        return CGPoint(x: on.x - (view.frame.width / 2), y: on.y - (view.frame.height / 2))
    }
    
}

//
//  Utilities.swift
//  Monopoly
//
//  Created by Tillson Galloway on 10/4/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit

class Utilities {
    
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

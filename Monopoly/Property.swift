//
//  Property.swift
//  Monopoly
//
//  Created by Tillson Galloway on 8/24/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit

class Property {
    
    let name: String
    let price: Int
    let color: Color
    
    var location: Int
    var owner: Player?
    
    init(name: String, location: Int, color: Color, price: Int) {
        self.name = name
        self.price = price
        self.color = color
        self.location = location
    }
    
}

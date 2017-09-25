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
    let color: String // TODO: Make color enum
    
    var location: Int
    var owner: Player
    
    init(name: String, location: Int, price: Int) {
        self.name = name
        self.location = location
        self.price = price
    }
    
}

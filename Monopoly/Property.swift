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
    let rent: Int
    
    var location: Int
    var owner: Player?
    
    var view: UIView!
    
    init(name: String, location: Int, color: Color, price: Int, rent: Int) {
        self.name = name
        self.price = price
        self.color = color
        self.location = location
        self.rent = rent
    }
    
}

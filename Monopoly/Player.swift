//
//  Player.swift
//  Monopoly
//
//  Created by Tillson Galloway on 8/24/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit

class Player {
    
    let name: String
    var location: Int
    var money = 500000
    
    init(name: String, location: Int) {
        self.name = name
        self.location = location
    }
    
}
 

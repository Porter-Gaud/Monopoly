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

    var location = 0
    var money = 500
    var turnsInJail = 0
    var inJail = false
    
    var moneyLabel: UILabel!
    var playerMarker: UILabel!
    
    
    
    init(name: String, location: Int) {
        self.name = name
        self.location = location
    }
    
    func move(spaces: Int) {
        // move player to new location
    }
    
    func spend(moneyToSpend: Int) {
        // spend money
    }
    
    func getPaid(amount: Int) {
        // Get paid (e.g. rent)
    }
    
}
 

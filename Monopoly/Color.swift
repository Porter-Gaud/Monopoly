//
//  Color.swift
//  Monopoly
//
//  Created by Tillson Galloway on 9/25/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import Foundation

enum Color: String {
    case purple = "purple"
    case blue = "blue"
    case pink = "pink"
    case orange = "orange"
    case red = "red"
    case yellow = "yellow"
    case green = "green"
    case navy = "navy"
    case black = "black"
    case sliver = "silver" // utility
    case blank = "blank" // railroad
    case special = "special" // chance/community/etc.
    
    func fromString(color: String) -> Color {
        return Color(rawValue: color)!
    }
}

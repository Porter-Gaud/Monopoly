//
//  Color.swift
//  Monopoly
//
//  Created by Tillson Galloway on 9/25/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import Foundation

/*
 https://jackmagic88.files.wordpress.com/2011/12/blanc-board-with-colour.png
*/

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

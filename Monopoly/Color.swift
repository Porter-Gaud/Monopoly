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

enum Color {
     case purple, blue, pink, orange, red, yellow, green, navy, black, special
    
    func fromString(color: String) -> Color {
        return Color(rawValue: color)
    }
}

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
        
        let bundle = Bundle.main
        let path = bundle.path(forResource: "properties", ofType: "txt")
        do {
            let content = try NSString(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
            print(content)
        } catch let error as Error {
            print("Error while loading properties from file: \(error)")
            return properties
        }
        return properties
        

    }
}

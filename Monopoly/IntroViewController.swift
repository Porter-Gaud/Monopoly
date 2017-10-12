//
//  IntroViewController.swift
//  Monopoly
//
//  Created by Tillson Galloway on 9/25/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit


class IntroViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var playerNumberWarning: UILabel!
    @IBOutlet weak var playerPickerView: UIPickerView!
    let numbersOfPlayersArray = ["2 Players", "3 Players", "4 Players" ,"5 Players", "6 Players"]
    var numberOfPlayers : Int = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return numbersOfPlayersArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return numbersOfPlayersArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        numberOfPlayers = row + 2
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startGame(_ sender: UIButton) {
        
        if numberOfPlayers >= 2 {
            
            performSegue(withIdentifier: "Segue", sender: self)
            
        } else {
            
            playerNumberWarning.text = "You need to select an amount of players"
            
        }
        
    }
    
}

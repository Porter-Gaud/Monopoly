//
//  IntroViewController.swift
//  Monopoly
//
//  Created by Tillson Galloway on 9/25/17.
//  Copyright © 2017 Porter-Gaud School. All rights reserved.
//

import UIKit


class IntroViewController: UIViewController {
    
    @IBOutlet weak var playerPickerView: UIPickerView!
    
    var numberOfPlayers = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        performSegue(withIdentifier: "startGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            // TIP: Load player names in here!
            (segue.destination as! ViewController).playerCount = numberOfPlayers
        }
    }
    
}

extension IntroViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 2) Players"
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5 // [2, 3, 4, 5, 6] players
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberOfPlayers = row + 2
        
    }

}


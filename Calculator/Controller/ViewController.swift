//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isFinishedTypingNumber : Bool = true
    
    var calculateMethod = Calculator()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayNumber: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error trying to cast label to Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        calculateMethod.setNumber(displayNumber)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculateMethod.calculate(symbol: calcMethod ) {
                displayNumber = result
            }
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let newValue = sender.currentTitle {
            
            if let currentDiplay = displayLabel.text {
                
                if isFinishedTypingNumber {
                    
                    if newValue == "." {
                        if displayNumber == 0 {
                            displayLabel.text = "0."
                        } else if !currentDiplay.contains(newValue) {
                            displayLabel.text = newValue
                        }
                        
                    } else {
                        displayLabel.text = newValue
                    }
                    
                    isFinishedTypingNumber = false
                } else {
                    
                    if newValue == "." {
                        let floorValue = floor(displayNumber)
                        let isInt:Bool = ( floorValue == displayNumber )

                        if !isInt || floorValue == 0 {
                            return
                        }
                    }
                    
                    displayLabel.text = currentDiplay + newValue
                    
                }
            }
        }
    
    }

}


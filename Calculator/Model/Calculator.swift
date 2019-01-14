//
//  Calculator.swift
//  Calculator
//
//  Created by Clovis Magenta da Cunha on 11/01/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    
    private var numberValue: Double?
    
    private var intermediateCalculation : (n1 : Double, calcMethod : String)?
    
    mutating func setNumber(_ newNumber: Double) {
        self.numberValue = newNumber
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if var calcNumber = numberValue {
         
            switch symbol {
                case "+/-":
                    if calcNumber != 0 {
                        calcNumber *= -1
                    }
                case "%":
                    calcNumber *=  0.01
                case "AC":
                    calcNumber = 0
                case "=":
                    calcNumber = performTwoNumberCalculation( n2:calcNumber )
                default:
                    intermediateCalculation = (n1: calcNumber, calcMethod: symbol)
                    return nil
                }
            
            setNumber( calcNumber )
        }
        
        
        return numberValue!
    }
    
    private func performTwoNumberCalculation( n2:Double ) -> Double {
        
        var result : Double = 0.0
        
        if let n1 = intermediateCalculation?.n1 {
            if let calcMethod = intermediateCalculation?.calcMethod {
                
                switch calcMethod {
                case "+":
                    result = n1 + n2
                case "×":
                    result = n1 * n2
                case "÷":
                    result = n1 / n2
                case "-":
                    result = n1 - n2
                default:
                    result = 0.0
                }
            }
        }
        
        return result
    }
}

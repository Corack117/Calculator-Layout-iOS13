//
//  CalculatroLogic.swift
//  Calculator Layout iOS13
//
//  Created by Sergio Ordaz Romero on 12/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performCalculateion(n2: n)
            case "AC":
                return 0
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performCalculateion(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let opertaion = intermediateCalculation?.calcMethod {
            switch opertaion {
                case "+":
                    return n1 + n2
                case "-":
                    return n1 - n2
                case "*":
                    return n1 * n2
                case "/":
                    return n1 / n2
                default:
                    fatalError("The opertaion passed in does not match any of the cases.")
            }
        }
        return nil
    }
}

//
//  ViewController.swift
//  Calculator
//
//  Created by Bekir Duran on 20.04.2020.
//  Copyright © 2020 info. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    private var calculator = CalculatorLogic()

    @IBAction func pressedOperator(_ sender: UIButton) {
               isFinishedTypingNumber = true
               
               calculator.setNumber(displayValue)
               
               if let calcMethod = sender.currentTitle {
        
                   if let result = calculator.calculate(symbol: calcMethod) {
                       displayValue = result
                   }
               }

    }
    

    @IBAction func pressedNumber(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
    
    
}


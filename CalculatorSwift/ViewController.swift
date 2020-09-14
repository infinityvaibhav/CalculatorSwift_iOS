//
//  ViewController.swift
//  CalculatorSwift
//
//  Created by Vaibhav Upadhyay on 07/09/20.
//  Copyright © 2020 Vaibhav Upadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayValueLabel: UILabel!
    
    private var numberOnScreen: Double = 0
    private var previousNumber: Double = 0
    private var performingMath = false
    private var operation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numbers(_ sender: RoundButton) {
        if performingMath == true {
            displayValueLabel.text = String(sender.tag-1)
            numberOnScreen = Double(displayValueLabel.text!)!
            performingMath = false
        } else {
            displayValueLabel.text = displayValueLabel.text! + String(sender.tag-1)
            guard let number = displayValueLabel.text else {return }
            numberOnScreen = Double(number) ??  0
        }
    }
    
    @IBAction func buttons(_ sender: RoundButton) {
        let tag = sender.tag
        if displayValueLabel.text != "" && tag != 11 && tag != 16{
            miscellaneousFunctions(tag: tag)
        } else if tag == 16 {
            performingMathOperation()
        } else if tag == 11 {
            resetValue()
        }
    }
    
    func miscellaneousFunctions(tag: Int) {
        
        guard let previous = displayValueLabel.text else {return }
        previousNumber = Double(previous) ??  0
        
        switch tag {
        case 12:  //Divide
            displayValueLabel.text = "/"
        case 13:  //Multiply
            displayValueLabel.text = "x"
        case 14:  //Subtract
            displayValueLabel.text = "-"
        case 15:  //Add
            displayValueLabel.text =  "+"
        case 17:  //Mod
            displayValueLabel.text = "%"
        case 19:  //Point
            displayValueLabel.text = "."
        default:
            displayValueLabel.text = ""
        }
        operation = tag
        performingMath = true
    }
    
    func performingMathOperation() {
        
        switch operation {
        case 12:
            displayValueLabel.text = String(previousNumber / numberOnScreen)
        case 13:  //Multiply
            displayValueLabel.text = String(previousNumber * numberOnScreen)
        case 14:  //Subtract
            displayValueLabel.text = String(previousNumber - numberOnScreen)
        case 15:  //Add
            displayValueLabel.text = String(previousNumber + numberOnScreen)
        case 17: //Modullus
            displayValueLabel.text = String(previousNumber.truncatingRemainder(dividingBy: numberOnScreen))
        default:
            displayValueLabel.text = ""
        }
    }
    
    func resetValue() {
        displayValueLabel.text = ""
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
    }
    
}


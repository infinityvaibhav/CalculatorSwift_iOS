//
//  RoundButton.swift
//  CalculatorSwift
//
//  Created by Vaibhav Upadhyay on 07/09/20.
//  Copyright © 2020 Vaibhav Upadhyay. All rights reserved.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}

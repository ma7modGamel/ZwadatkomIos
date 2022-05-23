//
//  OTPTextField.swift
//  RavenExpressB2b
//
//  Created by Yousef Mohamed on 19/03/2022.
//

import UIKit

class OTPTextField: UITextField {
    
        var previousTextField: UITextField?
        var nextTextFiled: UITextField?
    
        override func deleteBackward() {
            text = ""
            previousTextField?.becomeFirstResponder()
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = ColorName.grayColor.color.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
}

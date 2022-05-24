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
    
    init() {
        super.init(frame: .zero)
        textAlignment = .center
        keyboardType = .numberPad
        backgroundColor = ColorName.lightGray.color
        layer.cornerRadius = 18
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}

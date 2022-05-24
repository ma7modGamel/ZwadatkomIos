//
//  OTPView.swift
//  RavenExpressB2b
//
//  Created by Yousef Mohamed on 19/03/2022.
//

import UIKit

class OTPStackView: UIStackView {
    
    var textFieldArray = [OTPTextField]()
    var numberOfOTPDigit: Int

    init (numberOfOTPDigit: Int) {
        self.numberOfOTPDigit = numberOfOTPDigit
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getOTPAsText() -> String {
        var OTP = ""
        self.arrangedSubviews.forEach { view in
            guard let char = (view as! OTPTextField).text else { return }
            OTP.append(char)
        }
        return OTP
    }
    
    private func setup() {
        setupStackView()
        setTextFields()
    }
    //To setup stackView
    private func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 10
    }

    //To setup text fields
    private func setTextFields() {
        for i in 0 ..< numberOfOTPDigit {
            
            let field = OTPTextField()

            textFieldArray.append(field)
            addArrangedSubview(field)
            field.delegate = self
            field.textAlignment = .center
            
            i != 0 ? (field.previousTextField = textFieldArray[i-1]) : ()
            i != 0 ? (textFieldArray[i-1].nextTextFiled = textFieldArray[i]) : ()
            
        }
    }
}

extension OTPStackView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let field = textField as? OTPTextField else { return true }
        if !string.isEmpty {
            field.text = string
            field.resignFirstResponder()
            field.nextTextFiled?.becomeFirstResponder()
            return true
        }
        return true
    }
}

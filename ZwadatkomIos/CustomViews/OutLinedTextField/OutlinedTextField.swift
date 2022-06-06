//
//  OutlinedTextField.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit

 
class OutlinedTextField: UITextField {
    
    // MARK:- Properties
    private var padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)

    private let errorLabel = UILabel(frame: .zero)
    
    //Life cycle methods
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func borderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = false
        layerCornerRadius = 12
        layerBorderColor = UIColor(hexString: "EDEDED")
        layerBorderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 53).isActive = true
        self.font = UIFont(font: FontFamily.BahijTheSansArabic.semiLight, size: 12)
        self.textColor = ColorName.semiGray.color
        self.textAlignment = .natural
    }
}

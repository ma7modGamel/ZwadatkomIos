//
//  TextFieldWithIcon.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 22/05/2022.
//

import UIKit

class TextFieldWithIcon: UITextField {
    
    // MARK: - Properties
    private var rectHeight: CGFloat = 52
    private var padding = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 45)
    private var textFont = UIFont(font: FontFamily.BahijTheSansArabic.light, size: 16)
    private var placeHolderText = String()
    
    // Life cycle methods
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
    
    init(icon: Asset, placeHolder: String) {
        super.init(frame: .zero)
        self.placeHolderText = placeHolder
    }
    
    init(icon: String) {
        super.init(frame: .zero)
        self.setIcon(icon)
        self.setup()
    }
    
    init(icon: Asset) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: rectHeight).isActive = true
        self.backgroundColor = ColorName.offGray.color
        self.textColor = ColorName.semiGray.color

        self.layer.cornerRadius = 12
        self.textAlignment = .right
        self.font = textFont
    }

    func setIcon(_ imageName: String) {
        self.leftViewMode = .always
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        let image = UIImage(systemName: imageName, withConfiguration: config)?.withTintColor(ColorName.semiGray.color, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image )
        imageView.translatesAutoresizingMaskIntoConstraints = true
        
        let outerView = UIView()
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.addSubview(imageView)
        
        outerView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: imageView.frame.size.width + 23,
                height: imageView.frame.size.height
            )
        )
        
        imageView.center = CGPoint(
            x: (outerView.bounds.size.width) / 2,
            y: outerView.bounds.size.height / 2
        )
        self.leftView = outerView
    }

}
